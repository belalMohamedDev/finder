

import 'package:json_annotation/json_annotation.dart';
part 'user_response.g.dart';

@JsonSerializable()
class UserDataModelResponse {
  bool? status;
  String? message;
  String? token;
  UserData? data;

    //from json
    factory UserDataModelResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelResponseFromJson(json);


  //to json
  Map<String, dynamic> toJson() => _$UserDataModelResponseToJson(this);
  UserDataModelResponse({this.status, this.message, this.data});


}


@JsonSerializable()
class UserData {
  String? sId;
  String? name;
  String? phone;
  String? password;
  String? image;
  String? address;
  bool? active;
  String? createdAt;
  String? updatedAt;
  int? iV;

      //from json
    factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);


  //to json
  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  UserData(
      {this.sId,
      this.name,
      this.phone,
      this.password,
      this.image,
      this.address,
      this.active,
      this.createdAt,
      this.updatedAt,
      this.iV});

}