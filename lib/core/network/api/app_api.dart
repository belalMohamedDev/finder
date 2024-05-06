import 'dart:io';

import 'package:dio/dio.dart';

import 'package:finder/core/network/api_constant/api_constant.dart';
import 'package:finder/feature/aiScreen/data/model/aiResponse/ai_response.dart';
import 'package:finder/feature/getFoundReportsScreen/data/model/foundResponse/found_response.dart';
import 'package:finder/feature/getFoundReportsScreen/data/model/requestParam/request_param.dart';
import 'package:finder/feature/getMissingRepotsScreen/data/model/requestParam/request_param.dart';
import 'package:finder/feature/login/data/model/loginResponse/login_response.dart';
import 'package:finder/feature/login/data/model/requestBody/request_body.dart';
import 'package:finder/feature/makeAPersonReport/data/model/makeAReportResponse/make_a_report_response.dart';
import 'package:finder/feature/makeAObjectReport/data/model/makeAReportResponse/make_a_report_object_response.dart';

import 'package:finder/feature/makeUnReport/data/model/makeUnReporyResponse/make_un_report_responses.dart';
import 'package:finder/feature/getMissingRepotsScreen/data/model/missingResponse/missing_response.dart';
import 'package:finder/feature/notifications/data/model/model/requestParam/request_param.dart';
import 'package:finder/feature/notifications/data/model/notificationResponse/notification_response.dart';
import 'package:finder/feature/updateUserData/data/model/requestBody/updateMyData/update_my_data_request_body.dart';
import 'package:finder/feature/profile/data/model/response/user_response.dart';
import 'package:finder/feature/signUp/data/model/registerResponse/register_response.dart';
import 'package:finder/feature/updatePassword/data/model/requestBody/updateMyPassword/update_my_password_request_body.dart';

import 'package:retrofit/retrofit.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.signup)
  @MultiPart()
  Future<RegisterResponse> register(
    @Part() String name,
    @Part() String password,
    @Part() String address,
    @Part() String phone,
    @Part() File image,
  );


  @POST(ApiConstants.ai)
  @MultiPart()
  Future<AiResponse> ai(
    @Part() File image,
  );



  @POST(ApiConstants.getFound)
  @MultiPart()
  Future<MakeUnReportResponse> makeUnReport(
    @Part() String address,
    @Part() String description,
    @Part() File image,
  );

  @POST(ApiConstants.getMissing)
  @MultiPart()
  Future<MakeAReportResopnse> makeAReport(
    @Part() String name,
    @Part() String age,
    @Part() String address,
    @Part() String clothesLastSeenWearing,
    @Part() String describtion,
    @Part() File image,
  );

  @POST(ApiConstants.getMissing)
  @MultiPart()
  Future<MakeAReportObjectResopnse> makeAReportObjet(
    @Part() String address,
    @Part() String describtion,
    @Part() File image,
  );

  @PUT(ApiConstants.updateMyImage)
  @MultiPart()
  Future<UserDataModelResponse> updateMyImage(
    @Part() File image,
  );

  @PUT(ApiConstants.updateMyPassword)
  Future<UserDataModelResponse> updateMyPassword(
    @Body() UpdatePasswordRequestBody updatePasswordRequestBody,
  );

  @PUT(ApiConstants.updateMyData)
  Future<UserDataModelResponse> updateMyData(
    @Body() UpdateMyDataRequestBody updateMyDataRequestBody,
  );

  @GET(ApiConstants.getMissing)
  Future<GetMissingResopnse> getMissing(
    @Queries() GetMissingReportQueries getMissingReportQueries,
  );

  @GET(ApiConstants.getFound)
  Future<GetFoundResopnse> getFound(
    @Queries() GetFoundReportQueries getFoundReportParam,
  );

  @GET(ApiConstants.getNotification)
  Future<NotificationResponse> getNotification(
    @Queries() GetNotificationQueries getNotificationQueries,
  );
}
