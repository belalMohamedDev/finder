
import 'package:finder/core/network/api/app_api.dart';
import 'package:finder/core/network/apiResult/api_reuslt.dart';
import 'package:finder/core/network/error_handler/api_error_handler.dart';
import 'package:finder/core/network/network_connectivity/connectivity_controller.dart';
import 'package:finder/feature/makeUnReport/data/model/makeUnReporyResponse/make_un_report_responses.dart';
import 'package:finder/feature/makeUnReport/data/model/requestBody/request_body.dart';

class MakeUnReportRepository {
  MakeUnReportRepository(this._apiService, this._networkInfo);
  final AppServiceClient _apiService;
  late final NetworkInfo _networkInfo;

  Future<ApiResult<MakeUnReportResponse>> makeUnReport(
    MakeUnReportRequestBody makeUnReportRequestBody,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.makeUnReport(
            makeUnReportRequestBody.address,
            makeUnReportRequestBody.description,
            makeUnReportRequestBody.image,
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
