
import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';

@JsonSerializable()
class ReportResponse {
  @JsonKey(name: "data")
  List<DataResponse>? data;

  ReportResponse({this.data});


  //from json
  factory ReportResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$ReportResponseToJson(this);


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