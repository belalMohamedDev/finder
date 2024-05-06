import 'package:finder/core/network/api/app_api.dart';
import 'package:finder/core/network/apiResult/api_reuslt.dart';
import 'package:finder/core/network/error_handler/api_error_handler.dart';
import 'package:finder/core/network/network_connectivity/connectivity_controller.dart';
import 'package:finder/feature/profile/data/model/requestBody/updateImage/update_image_request_body.dart';
import 'package:finder/feature/profile/data/model/response/user_response.dart';

class UpdateImageRepository {
  UpdateImageRepository(this._apiService, this._networkInfo);
  final AppServiceClient _apiService;
  late final NetworkInfo _networkInfo;

  Future<ApiResult<UserDataModelResponse>> updateImage(
    UpdateImageRequestBody updateImageRequestBody,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _apiService.updateMyImage(updateImageRequestBody.image);
        return ApiResult.success(response);
      } catch (error) {
        return ApiResult.failure(ErrorHandler.handle(error).apiErrorModel);
      }
    } else {
      //return  internet connection error
      return ApiResult.failure(DataSource.noInternetConnection.getFailure());
    }
  }
}
