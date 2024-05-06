import 'package:json_annotation/json_annotation.dart';
part 'request_body.g.dart';

@JsonSerializable()
class MakeAReportRequestBody {
  MakeAReportRequestBody(
      {required this.name,
      required this.age,
      required this.address,
      required this.clothesLastSeenWearing,
      required this.describtion,
      required this.image});
  final String name;
  final String age;
  final String address;
  final String clothesLastSeenWearing;
  final String describtion;
  final dynamic image;

  //from json
  factory MakeAReportRequestBody.fromJson(Map<String, dynamic> json) =>
      _$MakeAReportRequestBodyFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$MakeAReportRequestBodyToJson(this);
}
