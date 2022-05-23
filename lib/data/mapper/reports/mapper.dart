import 'package:finder/application/constant.dart';
import 'package:finder/data/responses/report/response.dart';
import 'package:finder/domain/models/reports/reports_model.dart';
import 'package:finder/application/extensions.dart';

extension ReportsMapper on ReportResponse? {
  ReportModel toDomain() {
    List<DataModel> dataResponse =
        (this?.data?.map((dataResponse) => dataResponse.toDomain()) ??
                const Iterable.empty())
            .cast<DataModel>()
            .toList();

    return ReportModel(dataResponse);
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
      this?.name.orEmpty() ?? Constant.empty,
      this?.nationalId.orZero() ?? Constant.zero,
      this?.age.toString() ?? Constant.empty,
      this?.area.orEmpty() ?? Constant.empty,
      this?.clothesLastSeenWearing.orEmpty() ?? Constant.empty,
      this?.gender.toString() ?? Constant.empty,
      this?.birthmark.orEmpty() ?? Constant.empty,
      this?.picture.orEmpty() ?? Constant.empty,
      this?.pictureUrl.orEmpty() ?? Constant.empty,
      this?.userId.orZero() ?? Constant.zero,
      this?.createdAt.orEmpty() ?? Constant.empty,
    );
  }
}
