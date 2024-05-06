import 'package:finder/core/common/loading/loading_shimmer.dart';
import 'package:finder/core/common/stateRenderer/error_state_renderer.dart';

import 'package:finder/feature/getFoundReportsScreen/logic/cubit/get_found_cubit.dart';

import 'package:finder/feature/getFoundReportsScreen/presentation/widgets/grid_view_found_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoundBody extends StatelessWidget {
  const FoundBody({super.key});

  @override
  Widget build(BuildContext context) {
    final getFoundCubit = context.read<GetFoundCubit>();
    return BlocBuilder<GetFoundCubit, GetFoundState<dynamic>>(
        buildWhen: (previous, current) => current is! LoadingFromPagination,
        builder: (context, state) {
          if (state is Loading) {
            return const LoadingShimmer();
          } else if (state is Error) {
            return ErrorFlowStateRender(
              errorCode: state.errorCode,
              errorMessage: state.errorMessage,
              retryActionFunction: () => getFoundCubit.getFound(),
            );
          } else if (state is Success) {
            return NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification.metrics.pixels ==
                          notification.metrics.maxScrollExtent &&
                      notification is ScrollUpdateNotification) {
                    getFoundCubit.getFound(fromPagination: true);
                  }
                  return true;
                },
                child: GridViewFoundWidget(getFoundCubit: getFoundCubit));
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
