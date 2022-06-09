class IncidentModel {
  String message;
  int statusCode;
  UnreportedIncidentModel? unreportedIncident;

  IncidentModel(this.message, this.statusCode, this.unreportedIncident);


}

class UnreportedIncidentModel {
  int id;
  String type;
  AttributesIncidentModel? attributes;

  UnreportedIncidentModel(this.id, this.type, this.attributes);


}

class AttributesIncidentModel {
  String area;
  String gender;
  String policeStation;
  String picture;
  String pictureUrl;
  int userId;
  String createdAt;

AttributesIncidentModel(
      this.area,
        this.gender,
        this.policeStation,
        this.picture,
        this.pictureUrl,
        this.userId,
        this.createdAt);


}
