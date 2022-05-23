import 'package:finder/application/constant.dart';
import 'package:finder/domain/models/login/login_model.dart';
import '../../responses/login/responses.dart';
import 'package:finder/application/extensions.dart';



extension UserResponsesMapper on UserResponses?{
  UserLoginModel toDomain(){
    return UserLoginModel(
        this?.id.orZero()?? Constant.zero,
        this?.type.orEmpty()?? Constant.empty,
        this?.attributes.toDomain());
  }
}



extension BaseResponsesMapper on BaseResponses?{
  BaseLoginModel toDomain(){
    return BaseLoginModel(this?.accessToken.orEmpty()??Constant.empty,
        this?.message.orEmpty()??Constant.empty,
        this?.statusCode.orZero()??Constant.zero,
        this?.user.toDomain());
  }
}



extension AttributesResponsesMapper on AttributesResponses?{
  AttributeLoginModel toDomain(){
    return AttributeLoginModel(this?.address.orEmpty()??Constant.empty,
        this?.createdAt.orEmpty()??Constant.empty,
        this?.email.orEmpty()??Constant.empty,
        this?.name.orEmpty()??Constant.empty,
        this?.nationalId.orZero()??Constant.zero,
        this?.phoneNumber.orEmpty()??Constant.empty,
        this?.picture.orEmpty()??Constant.empty,
        this?.pictureUrl.orEmpty()??Constant.empty,
    ) ;
  }
}




