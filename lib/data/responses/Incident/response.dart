class IncidentResponse {
  String? message;
  int? statusCode;
  UnreportedIncidentResponse? unreportedIncident;

  IncidentResponse({this.message, this.statusCode, this.unreportedIncident});

  IncidentResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['status_code'];
    unreportedIncident = json['unreported_incident'] != null
        ?  UnreportedIncidentResponse.fromJson(json['unreported_incident'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['message'] = message;
    data['status_code'] = statusCode;
    if (unreportedIncident != null) {
      data['unreported_incident'] = unreportedIncident!.toJson();
    }
    return data;
  }
}

class UnreportedIncidentResponse {
  int? id;
  String? type;
  AttributesIncidentResponse? attributes;

  UnreportedIncidentResponse({this.id, this.type, this.attributes});

  UnreportedIncidentResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    attributes = json['attributes'] != null
        ?  AttributesIncidentResponse.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}

class AttributesIncidentResponse {
  String? area;
  String? gender;
  String? policeStation;
  String? picture;
  String? pictureUrl;
  int? userId;
  String? createdAt;

  AttributesIncidentResponse(
      {this.area,
        this.gender,
        this.policeStation,
        this.picture,
        this.pictureUrl,
        this.userId,
        this.createdAt});

  AttributesIncidentResponse.fromJson(Map<String, dynamic> json) {
    area = json['area'];
    gender = json['gender'];
    policeStation = json['police_station'];
    picture = json['picture'];
    pictureUrl = json['picture_url'];
    userId = json['user_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['area'] = area;
    data['gender'] = gender;
    data['police_station'] = policeStation;
    data['picture'] = picture;
    data['picture_url'] = pictureUrl;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    return data;
  }
}
