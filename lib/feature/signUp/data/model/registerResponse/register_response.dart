import 'package:json_annotation/json_annotation.dart';
part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  bool? status;
  String? message;
  String? token;
  DataUser? data;

    //from json
    factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);


  //to json
  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);

  RegisterResponse({this.status, this.message, this.token, this.data});
}

@JsonSerializable()
class DataUser {
  String? name;
  String? phone;
  String? password;
  String? image;
  String? address;
  bool? active;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

     //from json
    factory DataUser.fromJson(Map<String, dynamic> json) =>
      _$DataUserFromJson(json);


  //to json
  Map<String, dynamic> toJson() => _$DataUserToJson(this);

  DataUser(
      {this.name,
      this.phone,
      this.password,
      this.image,
      this.address,
      this.active,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});
}
