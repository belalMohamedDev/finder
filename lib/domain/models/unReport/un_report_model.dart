class UnReportModel {
  List<DataModel>? data;

  UnReportModel( this.data);


}

class DataModel {
  int id;
  String type;
  AttributesModel? attributes;

  DataModel(this.id, this.type, this.attributes);

}

class AttributesModel {
  String area;
  String gender;
  String policeStation;
  String picture;
  String pictureUrl;
  int userId;
  String createdAt;

  AttributesModel(
      this.area,
        this.gender,
        this.policeStation,
        this.picture,
        this.pictureUrl,
        this.userId,
        this.createdAt);


}
