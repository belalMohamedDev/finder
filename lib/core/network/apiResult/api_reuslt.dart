import 'package:finder/core/network/failure/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_reuslt.freezed.dart';

@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(ApiErrorModel apiErrorModel) = Failure<T>;
}
