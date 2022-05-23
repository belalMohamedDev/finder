import 'package:dio/dio.dart';
import 'package:finder/data/network/failure/failure.dart';
class ErrorHandler implements Exception{
  late Failure failure;
  ErrorHandler.handle(dynamic error){
    if(error is DioError){
      // dio error so its an error from  response of the api or from dio itself
      failure =_handleError(error);
    }else{
      // default error
      failure=DataSource.unKnown.getFailure();
    }
  }
}

Failure _handleError(DioError error){
  switch(error.type){

    case DioErrorType.connectTimeout:
     return DataSource.connectTimeOut.getFailure();
    case DioErrorType.sendTimeout:
     return DataSource.sendTimeOut.getFailure();
    case DioErrorType.receiveTimeout:
   return DataSource.recieveTimeOut.getFailure();
    case DioErrorType.response:
      if (error.response != null && error.response?.statusCode != null && error.response?.statusMessage != null){
        return Failure(error.response?.statusCode??0, error.response?.statusMessage??"");
      }else{
        return DataSource.unKnown.getFailure();
      }

    case DioErrorType.cancel:
    return  DataSource.cancel.getFailure();
    case DioErrorType.other:
     return DataSource.unKnown.getFailure();
  }
}


enum DataSource{
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
  failureRequest

}

extension DataSourceExtension on DataSource{
  Failure getFailure(){
    switch(this){

      case DataSource.success:
        return Failure(ResponseCode.success, ResponseMessage.success);
      case DataSource.noContent:
        return Failure(ResponseCode.noContent, ResponseMessage.noContent);
      case DataSource.badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataSource.forBidden:
        return Failure(ResponseCode.forBidden, ResponseMessage.forBidden);
      case DataSource.unAutorised:
        return Failure(ResponseCode.unAutorised, ResponseMessage.unAutorised);
      case DataSource.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound);
      case DataSource.internetServerError:
        return Failure(ResponseCode.internetServerError, ResponseMessage.internetServerError);
      case DataSource.connectTimeOut:
        return Failure(ResponseCode.connectTimeOut, ResponseMessage.connectTimeOut);
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSource.recieveTimeOut:
        return Failure(ResponseCode.recieveTimeOut, ResponseMessage.recieveTimeOut);
      case DataSource.sendTimeOut:
        return Failure(ResponseCode.sendTimeOut, ResponseMessage.sendTimeOut);
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection, ResponseMessage.noInternetConnection);
      case DataSource.unKnown:
        return Failure(ResponseCode.unKnown, ResponseMessage.unKnown);
      case DataSource.failureRequest:
        return Failure(ResponseCode.failureRequest, ResponseMessage.failureRequest);
    }
  }
}

class ResponseCode{
  static const int success=200; //success with data
  static const int noContent=201; //success with no data (no content)
  static const int badRequest=400; //failure api rejected request
  static const int unAutorised=401;   //failure , user is not authorised (token expire)
  static const int forBidden=403; //failure api rejected request
  static const int notFound=404;
  static const int failureRequest=422; //failure api rejected request
  static const int internetServerError=500; //failure crash in server side


  //local status code
  static const int connectTimeOut=-1;
  static const int cancel=-2;
  static const int recieveTimeOut=-3;
  static const int sendTimeOut=-4;
  static const int cacheError=-5;
  static const int noInternetConnection=-6;
  static const int unKnown=-7;
}



class ResponseMessage{
  static const String success="Success"; //success with data
  static const String noContent="Success"; //success with no data (no content)
  static const String badRequest="Bad Request, Try again later"; //failure api rejected request
  static const String unAutorised="User is unauthorised, Try again later";   //failure , user is not authorised (token expire)
  static const String forBidden="Forbidden Request, Try again later"; //failure api rejected request
  static const String notFound="Failure ,not found";
  static const String internetServerError="some Thing went wrong ,Try again later"; //failure crash in server side
  static const String failureRequest="The given data was invalid."; //failure api rejected request

  //local status code
  static const String connectTimeOut="Time out error ,Try again later";
  static const String cancel="Request was cancelled ,Try again later";
  static const String recieveTimeOut="Time out error ,Try again later";
  static const String sendTimeOut="Time out error ,Try again later";
  static const String cacheError="Cache error ,Try again later";
  static const String noInternetConnection="please check your internet connection";
  static const String unKnown="some Thing went wrong ,Try again later";
}


class ApiInternalStatus{
  static const int success=200;
  static const int failure=422;
}