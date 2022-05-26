
import 'package:finder/data/responses/makeUnSpecificReport/response.dart';

import 'package:finder/domain/models/makeUnSpecificReport/model.dart';

import '../../../application/constant.dart';

import 'package:finder/application/extensions.dart';
extension MakeUnSpecificReportResponsesMapper on MakeSpecificUnReportResponse?{
  MakeSpecificUnReportModel toDomain(){
    return MakeSpecificUnReportModel(
        this?.data.toDomain());
  }
}



extension DataMakeUnSpecificReportResponsesMapper on DataMakeSpecificUnReportResponse?{
  DataMakeSpecificUnReportModel toDomain(){
    return DataMakeSpecificUnReportModel(
      this?.id.orZero()??Constant.zero,
      this?.type.orEmpty()??Constant.empty,
      this?.attributes.toDomain(),
    );
  }
}



extension AttributeMakeUnSpecificReportResponsesMapper on AttributesMakeSpecificUnReportResponse?{
  AttributesMakeSpecificUnReportModel toDomain() {
    return AttributesMakeSpecificUnReportModel(
      this?.area.orEmpty() ?? Constant.empty,
      this?.gender.orEmpty() ?? Constant.empty,
      this?.policeStation.orEmpty() ?? Constant.empty,
      this?.picture.orEmpty() ?? Constant.empty,
      this?.pictureUrl.orEmpty() ?? Constant.empty,
      this?.userId.orZero() ?? Constant.zero,
      this?.createdAt.orEmpty() ?? Constant.empty,

    );
  }

}