import 'package:finder/application/extensions.dart';
import '../../../application/constant.dart';
import '../../../domain/models/Incident/model.dart';
import '../../responses/Incident/response.dart';

extension IncidentResponseMapper on IncidentResponse? {
  IncidentModel toDomain() {
    return IncidentModel(
        this?.message.orEmpty() ?? Constant.empty,
        this?.statusCode.orZero() ?? Constant.zero,
        this?.unreportedIncident.toDomain());
  }
}

extension UnreportedIncidentResponseMapper on UnreportedIncidentResponse? {
  UnreportedIncidentModel toDomain() {
    return UnreportedIncidentModel(this?.id.orZero() ?? Constant.zero,
        this?.type.orEmpty() ?? Constant.empty, this?.attributes.toDomain());
  }
}

extension AttributesIncidentResponseMapper on AttributesIncidentResponse? {
  AttributesIncidentModel toDomain() {
    return AttributesIncidentModel(
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
