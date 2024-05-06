import 'package:json_annotation/json_annotation.dart';

part 'make_a_report_object_response.g.dart';

@JsonSerializable()
class MakeAReportObjectResopnse {
  bool? status;
  String? message;
  MakeAReportObjectData? data;

  MakeAReportObjectResopnse({this.status, this.message, this.data});

  //from json
  factory MakeAReportObjectResopnse.fromJson(Map<String, dynamic> json) =>
      _$MakeAReportObjectResopnseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$MakeAReportObjectResopnseToJson(this);
}

@JsonSerializable()
class MakeAReportObjectData {
  String? address;
  String? describtion;
  String? image;
  String? user;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  MakeAReportObjectData(
      {this.address,
      this.describtion,
      this.image,
      this.user,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  //from json
  factory MakeAReportObjectData.fromJson(Map<String, dynamic> json) =>
      _$MakeAReportObjectDataFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$MakeAReportObjectDataToJson(this);
}
