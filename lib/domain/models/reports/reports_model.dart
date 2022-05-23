//reports model
class ReportModel {
  List<DataModel>? data;

  ReportModel(this.data);


}

class DataModel {
  int id;
  String type;
  AttributesModel? attributes;

  DataModel(this.id, this.type, this.attributes);

}

class AttributesModel {
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

