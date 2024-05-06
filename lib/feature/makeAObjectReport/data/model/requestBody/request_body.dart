
import 'package:json_annotation/json_annotation.dart';
part 'request_body.g.dart';

@JsonSerializable()
class MakeAReportOjectRequestBody{

  MakeAReportOjectRequestBody({required this.address,required this.describtion,required this.image});


    final String address;

    final String describtion;

  final dynamic image;

      //from json
    factory MakeAReportOjectRequestBody.fromJson(Map<String, dynamic> json) =>
      _$MakeAReportOjectRequestBodyFromJson(json);


  //to json
  Map<String, dynamic> toJson() => _$MakeAReportOjectRequestBodyToJson(this);
}




