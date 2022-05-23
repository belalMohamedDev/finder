
import 'package:finder/data/responses/MakeSpecificReport/response.dart';
import 'package:finder/domain/models/makeSpecificReport/model.dart';

import '../../../application/constant.dart';

import 'package:finder/application/extensions.dart';
extension MakeSpecificReportResponsesMapper on MakeSpecificReportResponse?{
  MakeSpecificReportModel toDomain(){
    return MakeSpecificReportModel(
        this?.data.toDomain());
  }
}



extension DataMakeSpecificReportResponsesMapper on DataMakeSpecificReportResponse?{
  DataMakeSpecificReportModel toDomain(){
    return DataMakeSpecificReportModel(
      this?.id.orZero()??Constant.zero,
      this?.type.orEmpty()??Constant.empty,
      this?.attributes.toDomain(),
    );
  }
}



extension AttributeMakeSpecificReportResponsesMapper on AttributesMakeSpecificReportResponse?{
  AttributesMakeSpecificReportModel toDomain(){
    return AttributesMakeSpecificReportModel(
      this?.name.orEmpty()??Constant.empty,
      this?.nationalId.orZero()??Constant.zero,
      this?.age.orEmpty()??Constant.empty,
      this?.area.orEmpty()??Constant.empty,
      this?.clothesLastSeenWearing.orEmpty()??Constant.empty,
      this?.gender.orEmpty()??Constant.empty,
      this?.birthmark.orEmpty()??Constant.empty,
      this?.picture.orEmpty()??Constant.empty,
      this?.pictureUrl.orEmpty()??Constant.empty,
      this?.userId.orZero()??Constant.zero,
      this?.createdAt.orEmpty()??Constant.empty,

    ) ;
  }
}