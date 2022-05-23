import 'package:json_annotation/json_annotation.dart';


part 'response.g.dart';

@JsonSerializable()
class RegisterModelResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "status_code")
  int? statusCode;
  @JsonKey(name: "user")
  UserRegisterResponse? user;

  RegisterModelResponse({this.message, this.statusCode, this.user});

  //from json
  factory RegisterModelResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$RegisterModelResponseToJson(this);

}

@JsonSerializable()
class UserRegisterResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "attributes")
  AttributesRegisterResponse? attributes;

  UserRegisterResponse({this.id, this.type, this.attributes});

  //from json
  factory UserRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$UserRegisterResponseToJson(this);

}

@JsonSerializable()
class AttributesRegisterResponse {
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

  AttributesRegisterResponse(
      {this.name,
        this.nationalId,
        this.email,

        this.address,
        this.phoneNumber,
        this.picture,
        this.pictureUrl,
        this.createdAt});


  //from json
  factory AttributesRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$AttributesRegisterResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$AttributesRegisterResponseToJson(this);

}