

class MakeReportModel {
  String message;
  int statusCode;
  ReportDataModel? report;

  MakeReportModel(this.message, this.statusCode, this.report);

}

class ReportDataModel {
  int id;
  String type;
  AttributesModel? attributes;

  ReportDataModel(this.id, this.type, this.attributes);


}

class AttributesModel {
  String name;
  String nationalId;
  String age;
  String area;
  String clothesLastSeenWearing;
  String gender;
  String birthmark;
  String picture;
  String pictureUrl;
  int userId;
  String createdAt;

  AttributesModel(
      this.name,
        this.nationalId,
        this.age,
        this.area,
        this.clothesLastSeenWearing,
        this.gender,
        this.birthmark,
        this.picture,
        this.pictureUrl,
        this.userId,
        this.createdAt);


}