


import 'package:finder/application/extensions.dart';
import 'package:finder/data/responses/updateUser/response.dart';
import 'package:finder/domain/models/updateUser/model.dart';
import '../../../application/constant.dart';


extension UpdateMapper on UpdateResponse? {
  UpdateModel toDomain() {
    return UpdateModel(

      this?.message.orEmpty() ?? Constant.empty,
      this?.statusCode.orZero() ?? Constant.zero,
      this?.user.toDomain(),
    );
  }
}





extension UpdateUserMapper on UserUpdateResponse? {
  UserUpdateModel toDomain() {
    return UserUpdateModel(
      this?.id.orZero() ?? Constant.zero,
      this?.type.orEmpty() ?? Constant.empty,
      this?.attributes.toDomain(),
    );
  }
}

extension AtrriabutesUpdateMapper on AttributesUpdateResponse? {
  AttributesUpdateModel toDomain() {
    return AttributesUpdateModel(
      this?.name.orEmpty() ?? Constant.empty,
      this?.nationalId.orEmpty() ?? Constant.empty,
      this?.email.toString() ?? Constant.empty,
      this?.address.orEmpty() ?? Constant.empty,
      this?.phoneNumber.orEmpty() ?? Constant.empty,
      this?.picture.orEmpty() ?? Constant.empty,
      this?.pictureUrl.orEmpty() ?? Constant.empty,
      this?.createdAt.orEmpty() ?? Constant.empty,
    );
  }
}