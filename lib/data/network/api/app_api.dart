
import 'package:dio/dio.dart';
import 'package:finder/application/constant.dart';
import 'package:finder/data/responses/MakeSpecificReport/response.dart';
import 'package:finder/data/responses/logOut/response.dart';
import 'package:finder/data/responses/login/responses.dart';
import 'package:finder/data/responses/makeReport/response.dart';
import 'package:finder/data/responses/makeUnReport/make_un_report.dart';
import 'package:finder/data/responses/makeUnSpecificReport/response.dart';
import 'package:finder/data/responses/register/response.dart';
import 'package:finder/data/responses/updateUser/response.dart';

import 'package:retrofit/retrofit.dart';


import '../../../application/app_prefs.dart';
import '../../../application/di.dart';
import '../../responses/report/response.dart';
import '../../responses/unReport/un_report_response.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {

  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;


  @POST("/api/login")
  Future<BaseResponses> login(
    @Field("national_id") String nationalId,
    @Field("password") String password,
    
  );


  @POST("/api/register")
  Future<RegisterModelResponse> register(
      @Field("name") String name,
      @Field("national_id") String nationalId,
      @Field("email") String email,
      @Field("password") String password,
      @Field("address") String address,
      @Field("phone_number") String phoneNumber,
      @Field("picture") dynamic picture,

      );



  @GET("/api/reports")
  Future<ReportResponse> getReports();


  @GET("/api/unreportedincidents")
  Future<UnReportResponse> getUnReports();



  @GET("/api/reports/")
  Future<MakeSpecificReportResponse> getSpecificReports();

  @GET("/api/unreportedincidents/1")
  Future<MakeSpecificUnReportResponse> getSpecificUnReports();

  @POST("/api/logout")
  Future<LogOutResponse> logOut();


  @POST("/api/reports")
  Future<MakeReportResponse> makeReport(
      @Field("name") String name,
      @Field("national_id") String nationalId,
      @Field("age") String age,
      @Field("area") String area,
      @Field("gender") String gender,
      @Field("picture") dynamic picture,
      @Field("clothes_last_seen_wearing") String clothesLastSeenWearing,
      @Field("birthmark") String birthmark,

      );



  @POST("/api/unreportedincidents")
  Future<MakeUnReportResponse> makeUnReport(
      @Field("area") String area,
      @Field("gender") String gender,
      @Field("police_station") String policeStation,
      @Field("picture") dynamic picture,

      );

  @POST("api/users")
  Future<UpdateResponse> updateUser({
    @Field("name") required String name,
    @Field("national_id")required String nationalId,
    @Field("email") required String email,
    @Field("password") required String password,
    @Field("address") required String address,
    @Field("phone_number") required String phoneNumber,
    @Field("picture") required dynamic picture,
    @Field("_method") String method = "put",
  });



}
