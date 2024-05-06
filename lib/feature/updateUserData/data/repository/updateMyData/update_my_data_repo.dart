import 'package:finder/core/network/api/app_api.dart';
import 'package:finder/core/network/apiResult/api_reuslt.dart';
import 'package:finder/core/network/error_handler/api_error_handler.dart';
import 'package:finder/core/network/network_connectivity/connectivity_controller.dart';

import 'package:finder/feature/updateUserData/data/model/requestBody/updateMyData/update_my_data_request_body.dart';
import 'package:finder/feature/profile/data/model/response/user_response.dart';

class UpdateMyDataRepository {
  UpdateMyDataRepository(this._apiService, this._networkInfo);
  final AppServiceClient _apiService;
  late final NetworkInfo _networkInfo;

  Future<ApiResult<UserDataModelResponse>> updateMyData(
    UpdateMyDataRequestBody updateMyDataRequestBody,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.updateMyData(
          updateMyDataRequestBody,
        );
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
