
import '../../../application/constant.dart';
import '../../../domain/models/makeReport/make_report_model.dart';
import '../../responses/makeReport/response.dart';
import 'package:finder/application/extensions.dart';
extension ReportResponsesMapper on ReportDataResponse?{
  ReportDataModel toDomain(){
    return ReportDataModel(
        this?.id.orZero()?? Constant.zero,
        this?.type.orEmpty()?? Constant.empty,
        this?.attributes.toDomain());
  }
}



extension MakeReportResponsesMapper on MakeReportResponse?{
  MakeReportModel toDomain(){
    return MakeReportModel(
        this?.message.orEmpty()??Constant.empty,
        this?.statusCode.orZero()??Constant.zero,
        this?.report.toDomain());
  }
}



extension AttributesResponsesMapper on AttributesResponse?{
  AttributesModel toDomain(){
    return AttributesModel(

      this?.name.orEmpty()??Constant.empty,
      this?.nationalId.orEmpty()??Constant.empty,
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
