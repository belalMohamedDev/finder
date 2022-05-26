import 'package:finder/data/network/request/request.dart';
import 'package:finder/data/responses/MakeSpecificReport/response.dart';
import 'package:finder/data/responses/logOut/response.dart';
import 'package:finder/data/responses/login/responses.dart';
import 'package:finder/data/responses/makeReport/response.dart';
import 'package:finder/data/responses/makeUnReport/make_un_report.dart';
import 'package:finder/data/responses/makeUnSpecificReport/response.dart';
import 'package:finder/data/responses/register/response.dart';
import 'package:finder/data/responses/report/response.dart';
import 'package:finder/data/responses/updateUser/response.dart';

import '../../network/api/app_api.dart';
import '../../responses/unReport/un_report_response.dart';

abstract class RemoteDataSource {
  Future<BaseResponses> login(LoginRequest loginRequest);
  Future<LogOutResponse> logOut();
  Future<RegisterModelResponse> register(RegisterRequest registerRequest);
  Future<ReportResponse> getReports();
  Future<MakeSpecificReportResponse> getSpecificReports();
  Future<MakeSpecificUnReportResponse> getSpecificUnReports();
  Future<UnReportResponse> getUnReports();
  Future<MakeReportResponse> makeReport(MakeReportRequest makeReportRequest);
  Future<MakeUnReportResponse> makeUnReport(
      MakeUnReportRequest makeUnReportRequest);

  Future<UpdateResponse> updateUser(UpdateUserRequest updateUserRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<BaseResponses> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.nationalId, loginRequest.password);
  }

  @override
  Future<RegisterModelResponse> register(
      RegisterRequest registerRequest) async {
    return await _appServiceClient.register(
        registerRequest.name,
        registerRequest.nationalId,
        registerRequest.email,
        registerRequest.password,
        registerRequest.address,
        registerRequest.phone,
        registerRequest.picture);
  }

  @override
  Future<ReportResponse> getReports() async {
    return await _appServiceClient.getReports();
  }

  @override
  Future<UnReportResponse> getUnReports() async {
    return await _appServiceClient.getUnReports();
  }

  @override
  Future<MakeReportResponse> makeReport(
      MakeReportRequest makeReportRequest) async {
    return await _appServiceClient.makeReport(
        makeReportRequest.name,
        makeReportRequest.nationalId,
        makeReportRequest.age,
        makeReportRequest.area,
        makeReportRequest.gender,
        makeReportRequest.picture,
        makeReportRequest.clothesLastSeenWearing,
        makeReportRequest.birthmark);
  }

  @override
  Future<MakeUnReportResponse> makeUnReport(
      MakeUnReportRequest makeUnReportRequest) async {
    return await _appServiceClient.makeUnReport(
      makeUnReportRequest.area,
      makeUnReportRequest.gender,
      makeUnReportRequest.policeStation,
      makeUnReportRequest.picture,
    );
  }

  @override
  Future<MakeSpecificReportResponse> getSpecificReports() async {
    return await _appServiceClient.getSpecificReports();
  }

  @override
  Future<LogOutResponse> logOut() async {
    return await _appServiceClient.logOut();
  }

  @override
  Future<UpdateResponse> updateUser(UpdateUserRequest updateUserRequest) async {
    return await _appServiceClient.updateUser(
      name:updateUserRequest.name,
       nationalId:  updateUserRequest.nationalId,
        email: updateUserRequest.email,
        password: updateUserRequest.password,
        address: updateUserRequest.address,
       phoneNumber:  updateUserRequest.phoneNumber,
        picture: updateUserRequest.picture
       );
  }

  @override
  Future<MakeSpecificUnReportResponse> getSpecificUnReports() async{
    return await _appServiceClient.getSpecificUnReports();
  }
}
