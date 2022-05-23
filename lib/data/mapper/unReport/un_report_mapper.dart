
import 'package:finder/data/responses/unReport/un_report_response.dart';

import 'package:finder/application/extensions.dart';
import '../../../application/constant.dart';
import '../../../domain/models/unReport/un_report_model.dart';

extension ReportsMapper on UnReportResponse? {
  UnReportModel toDomain() {
    List<DataModel> dataResponse =
    (this?.data?.map((dataResponse) => dataResponse.toDomain()) ??
        const Iterable.empty())
        .cast<DataModel>()
        .toList();

    return UnReportModel(dataResponse);
  }
}





extension DataMapper on DataResponse? {
  DataModel toDomain() {
    return DataModel(
      this?.id.orZero() ?? Constant.zero,
      this?.type.orEmpty() ?? Constant.empty,
      this?.attributes.toDomain(),
    );
  }
}

extension AtrriabutesMapper on AttributesResponse? {
  AttributesModel toDomain() {
    return AttributesModel(
      this?.area.orEmpty() ?? Constant.empty,
      this?.gender.orEmpty() ?? Constant.empty,
      this?.policeStation.toString() ?? Constant.empty,
      this?.picture.orEmpty() ?? Constant.empty,
      this?.pictureUrl.orEmpty() ?? Constant.empty,
      this?.userId.orZero() ?? Constant.zero,
      this?.createdAt.orEmpty() ?? Constant.empty,
    );
  }
}