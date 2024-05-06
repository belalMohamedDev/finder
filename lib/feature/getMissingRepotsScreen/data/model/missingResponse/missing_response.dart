import 'package:json_annotation/json_annotation.dart';
part 'missing_response.g.dart';

@JsonSerializable()
class GetMissingResopnse {
  bool? status;
  String? message;
  int? result;
  int? page;
  List<GetMissingData>? data;

  GetMissingResopnse(
      {this.status, this.message, this.result, this.page, this.data});

  //from json
  factory GetMissingResopnse.fromJson(Map<String, dynamic> json) =>
      _$GetMissingResopnseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$GetMissingResopnseToJson(this);
}

@JsonSerializable()
class GetMissingData {
  String? sId;
  String? name;
  int? age;
  String? address;
  String? clothesLastSeenWearing;
  String? describtion;
  String? image;
  UserMssinData? user;
  String? createdAt;
  String? updatedAt;
  int? iV;

  GetMissingData(
      {this.sId,
      this.name,
      this.age,
      this.address,
      this.clothesLastSeenWearing,
      this.describtion,
      this.image,
      this.user,
      this.createdAt,
      this.updatedAt,
      this.iV});

  //from json
  factory GetMissingData.fromJson(Map<String, dynamic> json) =>
      _$GetMissingDataFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$GetMissingDataToJson(this);
}

@JsonSerializable()
class UserMssinData {
  String? name;
  String? phone;
  String? address;

  UserMssinData({this.name, this.phone, this.address});

  //from json
  factory UserMssinData.fromJson(Map<String, dynamic> json) =>
      _$UserMssinDataFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$UserMssinDataToJson(this);
}
