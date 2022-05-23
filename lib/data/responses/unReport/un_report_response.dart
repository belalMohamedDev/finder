import 'package:json_annotation/json_annotation.dart';


part 'un_report_response.g.dart';




@JsonSerializable()
class UnReportResponse {
  @JsonKey(name: "data")
  List<DataResponse>? data;
  UnReportResponse({this.data});


  //from json
  factory UnReportResponse.fromJson(Map<String, dynamic> json) =>
      _$UnReportResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$UnReportResponseToJson(this);


}

@JsonSerializable()
class DataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "attributes")
  AttributesResponse? attributes;

  DataResponse({this.id, this.type, this.attributes});


  //from json
  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$DataResponseToJson(this);


}


@JsonSerializable()
class AttributesResponse {
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

  AttributesResponse(
      {this.area,
        this.gender,
        this.policeStation,
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