class MakeSpecificUnReportModel {
  DataMakeSpecificUnReportModel? data;

  MakeSpecificUnReportModel( this.data);

}

class DataMakeSpecificUnReportModel {
  int id;
  String type;
  AttributesMakeSpecificUnReportModel? attributes;

  DataMakeSpecificUnReportModel(this.id, this.type, this.attributes);


}

class AttributesMakeSpecificUnReportModel {
  String area;
  String gender;
  String policeStation;
  String picture;
  String pictureUrl;
  int userId;
  String createdAt;

  AttributesMakeSpecificUnReportModel(
      this.area,
        this.gender,
        this.policeStation,
        this.picture,
        this.pictureUrl,
        this.userId,
        this.createdAt);

}