part of 'update_user_data_cubit.dart';

@freezed
class UpdateMyDataState<T> with _$UpdateMyDataState<T> {
  const factory UpdateMyDataState.initial() = _Initial;
  const factory UpdateMyDataState.loading(FlowState flowState) = Loading;
  const factory UpdateMyDataState.success(UserDataModelResponse data) = Success<T>;
  const factory UpdateMyDataState.error(FlowState flowState) = Error;
  const factory UpdateMyDataState.imagePath(File imagePath) = ImagePath<T>;
  const factory UpdateMyDataState.showPassword(T showPassword) = ShowPassword<T>;
}
