import 'package:json_annotation/json_annotation.dart';
part 'request_body.g.dart';

@JsonSerializable()
class MakeUnReportRequestBody {
  MakeUnReportRequestBody(
      {required this.address, required this.description, required this.image});
  final String address;
  final String description;
  final dynamic image;

  //from json
  factory MakeUnReportRequestBody.fromJson(Map<String, dynamic> json) =>
      _$MakeUnReportRequestBodyFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$MakeUnReportRequestBodyToJson(this);
}
