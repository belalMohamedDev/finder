class MakeSpecificReportModel {
  DataMakeSpecificReportModel? data;

  MakeSpecificReportModel(this.data);


}

class DataMakeSpecificReportModel {
  int id;
  String type;
  AttributesMakeSpecificReportModel? attributes;

  DataMakeSpecificReportModel(this.id, this.type, this.attributes);


}

class AttributesMakeSpecificReportModel {
  String name;
  int nationalId;
  String age;
  String area;
  String clothesLastSeenWearing;
  String gender;
  String birthmark;
  String picture;
  String pictureUrl;
  int userId;
  String createdAt;

  AttributesMakeSpecificReportModel(
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