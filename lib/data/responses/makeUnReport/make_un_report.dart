import 'package:json_annotation/json_annotation.dart';
part 'make_un_report.g.dart';


@JsonSerializable()
class MakeUnReportResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "status_code")
  int? statusCode;
  @JsonKey(name: "unreported_incident")
  UnreportedIncidentResponse? unreportedIncident;

  MakeUnReportResponse(
      {this.message, this.statusCode, this.unreportedIncident});



  //from json
  factory MakeUnReportResponse.fromJson(Map<String, dynamic> json) =>
      _$MakeUnReportResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$MakeUnReportResponseToJson(this);


}

@JsonSerializable()
class UnreportedIncidentResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "attributes")
  AttributesMakeUnReportResponse? attributes;

  UnreportedIncidentResponse({this.id, this.type, this.attributes});



  //from json
  factory UnreportedIncidentResponse.fromJson(Map<String, dynamic> json) =>
      _$UnreportedIncidentResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$UnreportedIncidentResponseToJson(this);


}

@JsonSerializable()
class AttributesMakeUnReportResponse {
  @JsonKey(name: "area")
  String? area;
  @JsonKey(name: "gender")
  String? gender;
  @JsonKey(name: "police_station")
  String? policeStation;
  @JsonKey(name: "picture")
  String? picture;
  @JsonKey(name: "picture_url")
  String? pictureUrl;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "created_at")
  String? createdAt;

  AttributesMakeUnReportResponse(
      {this.area,
        this.gender,
        this.policeStation,
        this.picture,
        this.pictureUrl,
        this.userId,
        this.createdAt});



  //from json
  factory AttributesMakeUnReportResponse.fromJson(Map<String, dynamic> json) =>
      _$AttributesMakeUnReportResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$AttributesMakeUnReportResponseToJson(this);


}
