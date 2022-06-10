import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class UpdateResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "status_code")
  int? statusCode;
  @JsonKey(name: "user")
  UserUpdateResponse? user;

  UpdateResponse({this.message, this.statusCode, this.user});



  //from json
  factory UpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$UpdateResponseToJson(this);

}
@JsonSerializable()
class UserUpdateResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "attributes")
  AttributesUpdateResponse? attributes;

  UserUpdateResponse({this.id, this.type, this.attributes});


  //from json
  factory UserUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$UserUpdateResponseToJson(this);


}
@JsonSerializable()
class AttributesUpdateResponse {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "national_id")
  String? nationalId;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "phone_number")
  String? phoneNumber;
  @JsonKey(name: "picture")
  String? picture;
  @JsonKey(name: "picture_url")
  String? pictureUrl;
  @JsonKey(name: "created_at")
  String? createdAt;


  AttributesUpdateResponse(
      {this.name,
        this.nationalId,
        this.email,
        this.address,
        this.phoneNumber,
        this.picture,
        this.pictureUrl,
        this.createdAt});


  //from json
  factory AttributesUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$AttributesUpdateResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$AttributesUpdateResponseToJson(this);


}