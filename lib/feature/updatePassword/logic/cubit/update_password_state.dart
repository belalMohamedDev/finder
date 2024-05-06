part of 'update_password_cubit.dart';

@freezed
class UpdatePasswordState<T> with _$UpdatePasswordState<T> {
  const factory UpdatePasswordState.initial() = _Initial;
  const factory UpdatePasswordState.loading(FlowState flowState) = Loading;
  const factory UpdatePasswordState.success(UserDataModelResponse data) = Success<T>;
  const factory UpdatePasswordState.error(FlowState flowState) = Error;
  const factory UpdatePasswordState.imagePath(File imagePath) = ImagePath<T>;
  const factory UpdatePasswordState.showCurrentPassword(bool showCurrentPassword) = ShowCurrentPassword<T>;
  const factory UpdatePasswordState.showNewPassword(bool showNewPassword) = ShowNewPassword<T>;
  const factory UpdatePasswordState.showConfirmPassword(bool showConfirmPassword) = ShowConfirmPassword<T>;
}
