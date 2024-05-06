part of 'get_missing_cubit.dart';

@freezed
class GetMissingState<T>  with _$GetMissingState<T> {
  const factory GetMissingState.initial() = _Initial;
  const factory GetMissingState.loading() = Loading;
  const factory GetMissingState.getUnRebortsFromPaginationLoadingState () = LoadingFromPagination;
  const factory GetMissingState.success(List<GetMissingData> data) = Success<T>;
  const factory GetMissingState.error({required String errorMessage ,required int errorCode}) = Error;
  const factory GetMissingState.addItemToList(List<GetMissingData> getMissingData) = AddItemToList;
}
