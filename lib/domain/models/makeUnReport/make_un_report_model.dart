class MakeUnReportModel {
  String message;
  int statusCode;
  UnreportedIncidentModel ? unreportedIncident;

  MakeUnReportModel(this.message, this.statusCode, this.unreportedIncident);


}

class UnreportedIncidentModel  {
  int id;
  String type;
  AttributesMakeUnModel ? attributes;

  UnreportedIncidentModel (this.id, this.type, this.attributes);


}

class AttributesMakeUnModel  {
  String area;
  String gender;
  String policeStation;
  String picture;
  String pictureUrl;
  int userId;
  String createdAt;

  AttributesMakeUnModel (
      this.area,
        this.gender,
        this.policeStation,
        this.picture,
        this.pictureUrl,
        this.userId,
        this.createdAt);


}
