import 'package:finder/core/network/api/app_api.dart';
import 'package:finder/core/network/apiResult/api_reuslt.dart';
import 'package:finder/core/network/error_handler/api_error_handler.dart';
import 'package:finder/core/network/network_connectivity/connectivity_controller.dart';
import 'package:finder/feature/getFoundReportsScreen/data/model/foundResponse/found_response.dart';
import 'package:finder/feature/getFoundReportsScreen/data/model/requestParam/request_param.dart';

class GetFoundRepository {
  GetFoundRepository(this._apiService, this._networkInfo);
  final AppServiceClient _apiService;
  late final NetworkInfo _networkInfo;

  Future<ApiResult<GetFoundResopnse>> getFound(
       GetFoundReportQueries getFoundReportQueries,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.getFound(getFoundReportQueries);
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
