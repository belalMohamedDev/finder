part of 'notification_cubit.dart';

@freezed
class NotificationState<T> with _$NotificationState<T> {
  const factory NotificationState.initial() = _Initial;
  const factory NotificationState.loading() = Loading;
  const factory NotificationState.getNotificationFromPaginationLoadingState() = LoadingPagination;
  const factory NotificationState.success(NotificationResponse data) =Success<T>;
  const factory NotificationState.error(
      {required String errorMessage, required int errorCode}) = Error;
}
