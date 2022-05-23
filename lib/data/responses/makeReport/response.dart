import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class MakeReportResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "status_code")
  int? statusCode;
  @JsonKey(name: "report")
  ReportDataResponse? report;

  MakeReportResponse({this.message, this.statusCode, this.report});

  //from json
  factory MakeReportResponse.fromJson(Map<String, dynamic> json) =>
      _$MakeReportResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$MakeReportResponseToJson(this);

}
@JsonSerializable()
class ReportDataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "attributes")
  AttributesResponse? attributes;

  ReportDataResponse({this.id, this.type, this.attributes});

  //from json
  factory ReportDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportDataResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$ReportDataResponseToJson(this);


}
@JsonSerializable()
class AttributesResponse {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "national_id")
  String? nationalId;
  @JsonKey(name: "age")
  String? age;
  @JsonKey(name: "area")
  String? area;
  @JsonKey(name: "clothes_last_seen_wearing")
  String? clothesLastSeenWearing;
  @JsonKey(name: "gender")
  String? gender;
  @JsonKey(name: "birthmark")
  String? birthmark;
  @JsonKey(name: "picture")
  String? picture;
  @JsonKey(name: "picture_url")
  String? pictureUrl;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "created_at")
  String? createdAt;

  AttributesResponse(
      {this.name,
        this.nationalId,
        this.age,
        this.area,
        this.clothesLastSeenWearing,
        this.gender,
        this.birthmark,
        this.picture,
        this.pictureUrl,
        this.userId,
        this.createdAt});


  //from json
  factory AttributesResponse.fromJson(Map<String, dynamic> json) =>
      _$AttributesResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$AttributesResponseToJson(this);


}