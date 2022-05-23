import 'package:finder/domain/models/register/register_model.dart';
import 'package:finder/application/extensions.dart';
import '../../../application/constant.dart';
import '../../responses/register/response.dart';




extension BaseRegisterMapper on RegisterModelResponse?{
  BaseRegisterModel toDomain(){
    return BaseRegisterModel(
        this?.message.orEmpty()?? Constant.empty,
        this?.statusCode.orZero()?? Constant.zero,
        this?.user.toDomain());
  }
}

extension UserRegisterMapper on UserRegisterResponse?{
  UserRegisterModel toDomain(){
    return UserRegisterModel(
        this?.id.orZero()?? Constant.zero,
        this?.type.orEmpty()?? Constant.empty,
        this?.attributes.toDomain());
  }
}

extension AttributesRegisterMapper on AttributesRegisterResponse?{
  AttributesRegisterModel toDomain(){
    return AttributesRegisterModel(
        this?.name.orEmpty()?? Constant.empty,
        this?.nationalId.orEmpty()?? Constant.empty,
    this?.email.orEmpty()?? Constant.empty,
    this?.address.orEmpty()?? Constant.empty,
    this?.phoneNumber.orEmpty()?? Constant.empty,
    this?.picture.orEmpty()?? Constant.empty,
    this?.pictureUrl.orEmpty()?? Constant.empty,
    this?.createdAt.orEmpty()?? Constant.empty,
   );

  }
}