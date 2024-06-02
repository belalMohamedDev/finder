import 'package:bloc/bloc.dart';
import 'package:finder/feature/notifications/data/model/model/requestParam/request_param.dart';
import 'package:finder/feature/notifications/data/model/notificationResponse/notification_response.dart';
import 'package:finder/feature/notifications/data/repository/notification_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_state.dart';
part 'notification_cubit.freezed.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this._notificationRepository)
      : super(const NotificationState.initial());

  final NotificationRepository _notificationRepository;
    final List<DataNotification> dataList = [];
  int page = 1;




  Future  <void> getNotifications({bool fromPagination = false}) async {
    if (fromPagination) {
      emit(const NotificationState.getNotificationFromPaginationLoadingState());
    } else {
      emit(
        const NotificationState.loading(),
      );
    }

    final response = await _notificationRepository
        .getNotification(GetNotificationQueries(limit: 20, page: page));

    response.when(
      success: (getNotification) {
         if (getNotification.data!.isNotEmpty) {
          dataList.addAll(getNotification.data!);
          page++;
        }
        emit(NotificationState.success(getNotification));
      },
      failure: (error) {
        emit(
          NotificationState.error(
              errorCode: error.statusCode!, errorMessage: error.message!),
        );
      },
    );
  
  }


}
