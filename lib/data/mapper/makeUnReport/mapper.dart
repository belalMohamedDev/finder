
import 'package:finder/data/responses/makeUnReport/make_un_report.dart';
import 'package:finder/domain/models/makeUnReport/make_un_report_model.dart';

import '../../../application/constant.dart';

import 'package:finder/application/extensions.dart';
extension UnreportedIncidentResponsesMapper on UnreportedIncidentResponse?{
  UnreportedIncidentModel toDomain(){
    return UnreportedIncidentModel(
        this?.id.orZero()?? Constant.zero,
        this?.type.orEmpty()?? Constant.empty,
        this?.attributes.toDomain());
  }
}



extension MakeUnReportResponsesMapper on MakeUnReportResponse?{
  MakeUnReportModel toDomain(){
    return MakeUnReportModel(
        this?.message.orEmpty()??Constant.empty,
        this?.statusCode.orZero()??Constant.zero,
        this?.unreportedIncident.toDomain());
  }
}



extension AttributesResponsesMapper on AttributesMakeUnReportResponse?{
  AttributesMakeUnModel toDomain(){
    return AttributesMakeUnModel(
      this?.area.orEmpty()??Constant.empty,
      this?.gender.orEmpty()??Constant.empty,
      this?.policeStation.orEmpty()??Constant.empty,
      this?.picture.orEmpty()??Constant.empty,
      this?.pictureUrl.orEmpty()??Constant.empty,
      this?.userId.orZero()??Constant.zero,
      this?.createdAt.orEmpty()??Constant.empty,

    ) ;
  }
}