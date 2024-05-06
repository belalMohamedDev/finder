import 'package:dio/dio.dart';

import 'package:finder/core/network/failure/api_error_model.dart';

enum DataSource {
  success,
  noContent,
  badRequest,
  forBidden,
  unAutorised,
  notFound,
  internetServerError,
  connectTimeOut,
  cancel,
  recieveTimeOut,
  sendTimeOut,
  cacheError,
  noInternetConnection,
  unKnown,
  failureRequest,
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    switch (this) {
      case DataSource.success:
        return ApiErrorModel(
            statusCode: ResponseCode.success, message: ResponseMessage.success);
      case DataSource.noContent:
        return ApiErrorModel(
            statusCode: ResponseCode.noContent,
            message: ResponseMessage.noContent);

      case DataSource.forBidden:
        return ApiErrorModel(
            statusCode: ResponseCode.forBidden,
            message: ResponseMessage.forBidden);
      case DataSource.unAutorised:
        return ApiErrorModel(
            statusCode: ResponseCode.unAutorised,
            message: ResponseMessage.unAutorised);
      case DataSource.notFound:
        return ApiErrorModel(
            statusCode: ResponseCode.notFound,
            message: ResponseMessage.notFound);
      case DataSource.internetServerError:
        return ApiErrorModel(
            statusCode: ResponseCode.internetServerError,
            message: ResponseMessage.internetServerError);
      case DataSource.connectTimeOut:
        return ApiErrorModel(
            statusCode: ResponseCode.connectTimeOut,
            message: ResponseMessage.connectTimeOut);
      case DataSource.cancel:
        return ApiErrorModel(
            statusCode: ResponseCode.cancel, message: ResponseMessage.cancel);
      case DataSource.recieveTimeOut:
        return ApiErrorModel(
            statusCode: ResponseCode.recieveTimeOut,
            message: ResponseMessage.recieveTimeOut);
      case DataSource.sendTimeOut:
        return ApiErrorModel(
            statusCode: ResponseCode.sendTimeOut,
            message: ResponseMessage.sendTimeOut);
      case DataSource.cacheError:
        return ApiErrorModel(
            statusCode: ResponseCode.cacheError,
            message: ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return ApiErrorModel(
            statusCode: ResponseCode.noInternetConnection,
            message: ResponseMessage.noInternetConnection);
      case DataSource.unKnown:
        return ApiErrorModel(
            statusCode: ResponseCode.unKnown, message: ResponseMessage.unKnown);
      case DataSource.failureRequest:
        return ApiErrorModel(
            statusCode: ResponseCode.failureRequest,
            message: ResponseMessage.failureRequest);
      case DataSource.badRequest:
        return ApiErrorModel(
            statusCode: ResponseCode.badRequest,
            message: ResponseMessage.badRequest);
    }
  }
}

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      apiErrorModel = _handleError(error);
    } else {
      // default error
      apiErrorModel = DataSource.unKnown.getFailure();
    }
  }




}

ApiErrorModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeOut.getFailure();

    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeOut.getFailure();

    case DioExceptionType.receiveTimeout:
      return DataSource.recieveTimeOut.getFailure();

    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.unKnown.getFailure();
      }
    case DioExceptionType.unknown:
      return DataSource.unKnown.getFailure();

    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();

    case DioExceptionType.connectionError:
      return DataSource.noInternetConnection.getFailure();

    case DioExceptionType.badCertificate:
      return DataSource.badRequest.getFailure();
  }
}

class ResponseCode {
  static const int success = 200; //success with data
  static const int noContent = 201; //success with no data (no content)
  static const int badRequest = 400; //failure api rejected request
  static const int unAutorised =
      401; //failure , user is not authorised (token expire)
  static const int forBidden = 403; //failure api rejected request
  static const int notFound = 404;
  static const int failureRequest = 422; //failure api rejected request
  static const int internetServerError = 500; //failure crash in server side

  //local status code
  static const int connectTimeOut = -1;
  static const int cancel = -2;
  static const int recieveTimeOut = -3;
  static const int sendTimeOut = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int unKnown = -7;
}

class ResponseMessage {
  static const String success = "Success"; //success with data
  static const String noContent = "Success"; //success with no data (no content)
  static const String badRequest =
      "Bad Request, Try again later"; //failure api rejected request
  static const String unAutorised =
      "User is unauthorised, Try again later"; //failure , user is not authorised (token expire)
  static const String forBidden =
      "Forbidden Request, Try again later"; //failure api rejected request
  static const String notFound = "Failure ,not found";
  static const String internetServerError =
      "some Thing went wrong ,Try again later"; //failure crash in server side
  static const String failureRequest =
      "The given data was invalid."; //failure api rejected request

  //local status code
  static const String connectTimeOut = "Time out error ,Try again later";
  static const String cancel = "Request was cancelled ,Try again later";
  static const String recieveTimeOut = "Time out error ,Try again later";
  static const String sendTimeOut = "Time out error ,Try again later";
  static const String cacheError = "Cache error ,Try again later";
  static const String noInternetConnection =
      "please check your internet connection";
  static const String unKnown = "some Thing went wrong ,Try again later";
}

