import 'package:dio/dio.dart';
import 'package:finder/application/app_prefs.dart';
import 'package:finder/application/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String applicationJson = 'application/json';
const String contentType = "contentType";
const String accept = "Accept";
const String authorization = 'Authorization';

class DioFactory {
  final AppPreferences _appPreferences;
  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();
  


    // one min time out
    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      authorization: 'Bearer ${_appPreferences.isAccessToken()}'
    };

    dio.options = BaseOptions(
        responseType: ResponseType.plain,
        baseUrl: Constant.baseUrl,
        headers: headers,
        receiveDataWhenStatusError: true,
       sendTimeout: Constant.apiTimeOut,
       receiveTimeout: Constant.apiTimeOut,
       connectTimeout: Constant.apiTimeOut,);

    if (!kReleaseMode) {
      //its debug mode so print app logs
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseHeader: true));
    }

    return dio;
  }
}
