import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  LoginResponse({this.status, this.message, this.token, this.data});

    //from json
    factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);


  //to json
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  bool? status;
  String? message;
  String? token;
  DataUser? data;
}




@JsonSerializable()
class DataUser {
  DataUser({
    this.sId,
    this.name,
    this.phone,
    this.password,
    this.address,
    this.image,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.passwordChangedAt,
  });


      //from json
    factory DataUser.fromJson(Map<String, dynamic> json) =>
      _$DataUserFromJson(json);


  //to json
  Map<String, dynamic> toJson() => _$DataUserToJson(this);

  String? sId;
  String? name;
  String? phone;
  String? password;
  String? address;
  String? image;
  bool? active;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? passwordChangedAt;
}
