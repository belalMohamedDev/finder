part of 'profile_cubit.dart';

@freezed
class ProfileState<T> with _$ProfileState<T> {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading(FlowState flowState) = Loading;
  const factory ProfileState.success(UserDataModelResponse data) = Success<T>;
  const factory ProfileState.error(FlowState flowState) = Error;
  const factory ProfileState.imagePath(File imagePath) = ImagePath<T>;
  const factory ProfileState.showPassword(T showPassword) = ShowPassword<T>;
}
