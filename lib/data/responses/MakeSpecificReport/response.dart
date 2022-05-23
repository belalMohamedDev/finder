import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class MakeSpecificReportResponse {
  @JsonKey(name: "data")
  DataMakeSpecificReportResponse? data;

  MakeSpecificReportResponse({this.data});



  //from json
  factory MakeSpecificReportResponse.fromJson(Map<String, dynamic> json) =>
      _$MakeSpecificReportResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$MakeSpecificReportResponseToJson(this);


}
@JsonSerializable()
class DataMakeSpecificReportResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "attributes")
  AttributesMakeSpecificReportResponse? attributes;

  DataMakeSpecificReportResponse({this.id, this.type, this.attributes});



  //from json
  factory DataMakeSpecificReportResponse.fromJson(Map<String, dynamic> json) =>
      _$DataMakeSpecificReportResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$DataMakeSpecificReportResponseToJson(this);


}
@JsonSerializable()
class AttributesMakeSpecificReportResponse {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "national_id")
  int? nationalId;
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

  AttributesMakeSpecificReportResponse(
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
  factory AttributesMakeSpecificReportResponse.fromJson(Map<String, dynamic> json) =>
      _$AttributesMakeSpecificReportResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$AttributesMakeSpecificReportResponseToJson(this);


}