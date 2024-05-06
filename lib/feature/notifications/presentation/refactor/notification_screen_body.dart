import 'package:finder/core/common/loading/notification_loader_shimmer.dart';
import 'package:finder/core/common/stateRenderer/error_state_renderer.dart';
import 'package:finder/feature/notifications/logic/cubit/notification_cubit.dart';
import 'package:finder/feature/notifications/presentation/widgets/notification_success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreenBody extends StatelessWidget {
  const NotificationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: BlocBuilder<NotificationCubit, NotificationState>(
        buildWhen: (previous, current) => current is! LoadingPagination,
        builder: (context, state) {
          if (state is Loading) {
            return const NotificationLoaderShimmer();
          } else if (state is Error) {
            return ErrorFlowStateRender(
                errorCode: state.errorCode,
                errorMessage: state.errorMessage,
                retryActionFunction: () =>
                    context.read<NotificationCubit>().getNotifications());
          } else if (state is Success) {
            return NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification.metrics.pixels ==
                          notification.metrics.maxScrollExtent &&
                      notification is ScrollUpdateNotification) {
                    context
                        .read<NotificationCubit>()
                        .getNotifications(fromPagination: true);
                  }
                  return true;
                },
                child: NotificationSuccessWidget(state: state.data));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}