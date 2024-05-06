import 'package:finder/core/common/loading/loading_shimmer.dart';
import 'package:finder/core/common/stateRenderer/error_state_renderer.dart';
import 'package:finder/feature/getMissingRepotsScreen/logic/cubit/get_missing_cubit.dart';

import 'package:finder/feature/getMissingRepotsScreen/presentation/widgets/grid_view_missing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MissingBody extends StatelessWidget {
  const MissingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final getMissingCubit = context.read<GetMissingCubit>();
    return BlocBuilder<GetMissingCubit, GetMissingState<dynamic>>(
        buildWhen: (previous, current) => current is! LoadingFromPagination,
        builder: (context, state) {
          if (state is Loading) {
            return const LoadingShimmer();
          } else if (state is Error) {
            return ErrorFlowStateRender(
              errorCode: state.errorCode,
              errorMessage: state.errorMessage,
              retryActionFunction: () => getMissingCubit.getMissing(),
            );
          } else if (state is Success) {
            return NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification.metrics.pixels ==
                          notification.metrics.maxScrollExtent &&
                      notification is ScrollUpdateNotification) {
                    getMissingCubit.getMissing(fromPagination: true);
                  }
                  return true;
                },
                child: GridViewMissingWidget(getMissingCubit: getMissingCubit));
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}

