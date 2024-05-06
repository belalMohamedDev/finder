import 'package:json_annotation/json_annotation.dart';

part 'make_a_report_response.g.dart';

@JsonSerializable()
class MakeAReportResopnse {
  bool? status;
  String? message;
  MakeAReportData? data;

  MakeAReportResopnse({this.status, this.message, this.data});

  //from json
  factory MakeAReportResopnse.fromJson(Map<String, dynamic> json) => _$MakeAReportResopnseFromJson(json);



  //to json
  Map<String, dynamic> toJson() => _$MakeAReportResopnseToJson(this);


}


@JsonSerializable()
class MakeAReportData {
  String? name;
  int? age;
  String? address;
  String? clothesLastSeenWearing;
  String? describtion;
  String? image;
  String? user;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  MakeAReportData(
      {this.name,
      this.age,
      this.address,
      this.clothesLastSeenWearing,
      this.describtion,
      this.image,
      this.user,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});


  //from json
  factory MakeAReportData.fromJson(Map<String, dynamic> json) => _$MakeAReportDataFromJson(json);



  //to json
  Map<String, dynamic> toJson() => _$MakeAReportDataToJson(this);


}