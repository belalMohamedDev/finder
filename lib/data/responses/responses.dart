import 'package:json_annotation/json_annotation.dart';


 part 'responses.g.dart';



@JsonSerializable()
class BaseResponses {
  @JsonKey(name: "access_token")
  String? accessToken;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "status_code")
  int? statusCode;
  @JsonKey(name: "user")
  UserResponses? user;

  BaseResponses({this.accessToken, this.message, this.statusCode, this.user});

    //from json
   factory BaseResponses.fromJson(Map<String, dynamic> json) =>
      _$BaseResponsesFromJson(json);

  //to json
   Map<String, dynamic> toJson() => _$BaseResponsesToJson(this);
}










@JsonSerializable()
class UserResponses {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "attributes")
  AttributesResponses? attributes;

  UserResponses({this.id, this.type, this.attributes});

      //from json
   factory UserResponses.fromJson(Map<String, dynamic> json) =>
      _$UserResponsesFromJson(json);

  //to json
   Map<String, dynamic> toJson() => _$UserResponsesToJson(this);
}









@JsonSerializable()
class AttributesResponses {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "national_id")
  int? nationalId;
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

  AttributesResponses(
      {this.name,
      this.nationalId,
      this.email,
      this.address,
      this.phoneNumber,
      this.picture,
      this.pictureUrl,
      this.createdAt});


            //from json
   factory AttributesResponses.fromJson(Map<String, dynamic> json) =>
      _$AttributesResponsesFromJson(json);

  //to json
   Map<String, dynamic> toJson() => _$AttributesResponsesToJson(this);
}
