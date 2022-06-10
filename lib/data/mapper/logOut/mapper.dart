import 'package:finder/data/responses/logOut/response.dart';
import 'package:finder/domain/models/logOut/model.dart';
import 'package:finder/application/extensions.dart';
import '../../../application/constant.dart';

extension LogOutResponsesMapper on LogOutResponse?{
  LogOutModel toDomain(){
    return LogOutModel(
      this?.message.orEmpty()??Constant.empty,
      this?.statusCode.orZero()??Constant.zero,
       );
  }
}