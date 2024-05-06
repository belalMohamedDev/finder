
 import 'package:json_annotation/json_annotation.dart'  ;

 part 'make_un_report_responses.g.dart';



@JsonSerializable()
class MakeUnReportResponse {

  MakeUnReportResponse({this.status, this.message, this.data});


  //from json
  factory MakeUnReportResponse.fromJson(Map<String, dynamic> json) => _$MakeUnReportResponseFromJson(json);
  bool? status;
  String? message;
  DataMakeUnReportResponse? data;


  //to json
  Map<String, dynamic> toJson() => _$MakeUnReportResponseToJson(this);
}


@JsonSerializable()
class DataMakeUnReportResponse {

  DataMakeUnReportResponse(
      {this.address,
        this.image,
        this.description,
        this.user,
        this.sId,
        this.createdAt,
        this.updatedAt,
       });



  //from json
  factory DataMakeUnReportResponse.fromJson(Map<String, dynamic> json) => _$DataMakeUnReportResponseFromJson(json);

  String? address;
  String? image;
  String? description;
  String? user;
  String? sId;
  String? createdAt;
  String? updatedAt;


  //to json
  Map<String, dynamic> toJson() => _$DataMakeUnReportResponseToJson(this);
}
