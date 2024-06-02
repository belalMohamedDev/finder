part of 'get_found_cubit.dart';

@freezed
class GetFoundState<T> with _$GetFoundState<T> {
  const factory GetFoundState.initial() = _Initial;
  const factory GetFoundState.loading() = Loading;
  const factory GetFoundState.getRebortsFromPaginationLoadingState () = LoadingFromPagination;
  const factory GetFoundState.success(GetFoundResopnse data) = Success<T>;
  const factory GetFoundState.error({required String errorMessage ,required int errorCode}) = Error;
  const factory GetFoundState.addItemToList(List<GetFoundData> getFoundData) =
      AddItemToList;
}
