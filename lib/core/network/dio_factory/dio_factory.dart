import 'package:dio/dio.dart';
import 'package:finder/core/network/api_constant/api_constant.dart';
import 'package:finder/core/services/shared_pref/pref_keys.dart';
import 'package:finder/core/services/shared_pref/shared_pref.dart';

import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String applicationJson = 'application/json';
const String contentType = 'contentType';
const String accept = 'Accept';
const String authorization = 'Authorization';

class DioFactory {
  Future<Dio> getDio() async {
    final dio = Dio();

    // one min time out
    final headers = <String, String>{
      contentType: applicationJson,
      accept: applicationJson,
  
    };

    dio.options = BaseOptions(
      responseType: ResponseType.plain,
      baseUrl: ApiConstants.baseUrl,
      headers: headers,
      receiveDataWhenStatusError: true,
      sendTimeout: const Duration(milliseconds: ApiConstants.apiTimeOut),
      receiveTimeout: const Duration(milliseconds: ApiConstants.apiTimeOut),
      connectTimeout: const Duration(milliseconds: ApiConstants.apiTimeOut),
    );


    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] =
              'Bearer ${SharedPref().getString(PrefKeys.userToken)}';

          return handler.next(options);
        },
        onError: (error, handler) async {
         if (error.response?.statusCode == 401) {
       

        // Update the request header with the new access token
        error.requestOptions.headers['Authorization'] = 'Bearer ${SharedPref().getString(PrefKeys.userToken)}';

        // Repeat the request with the updated header
        return handler.resolve(await dio.fetch(error.requestOptions));
      }
      return handler.next(error);
    },
  
        
      ),
    );

    if (!kReleaseMode) {
      //its debug mode so print app logs
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }

    return dio;
  }
}
