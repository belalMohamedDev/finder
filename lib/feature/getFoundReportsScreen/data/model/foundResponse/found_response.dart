import 'package:json_annotation/json_annotation.dart';
part 'found_response.g.dart';

@JsonSerializable()
class GetFoundResopnse {
  bool? status;
  String? message;
  int? result;
  int? page;
  List<GetFoundData>? data;

  //from json
  factory GetFoundResopnse.fromJson(Map<String, dynamic> json) =>
      _$GetFoundResopnseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$GetFoundResopnseToJson(this);

  GetFoundResopnse(
      {this.status, this.message, this.result, this.page, this.data});
}

@JsonSerializable()
class GetFoundData {
  String? sId;
  String? address;
  String? image;
  String? description;
  UserFoundData? user;
  String? createdAt;
  String? updatedAt;
  int? iV;

  //from json
  factory GetFoundData.fromJson(Map<String, dynamic> json) =>
      _$GetFoundDataFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$GetFoundDataToJson(this);

  GetFoundData(
      {this.sId,
      this.address,
      this.image,
      this.description,
      this.user,
      this.createdAt,
      this.updatedAt,
      this.iV});
}

@JsonSerializable()
class UserFoundData {
  String? name;
  String? phone;
  String? address;

  UserFoundData({this.name, this.phone, this.address});

  //from json
  factory UserFoundData.fromJson(Map<String, dynamic> json) =>
      _$UserFoundDataFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$UserFoundDataToJson(this);
}
