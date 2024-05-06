import 'package:json_annotation/json_annotation.dart';
part 'ai_response.g.dart';

@JsonSerializable()
class AiResponse {
  String? message;
  bool? status;

  AiResponse({this.message, this.status});

    //from json
    factory AiResponse.fromJson(Map<String, dynamic> json) =>
      _$AiResponseFromJson(json);


  //to json
  Map<String, dynamic> toJson() => _$AiResponseToJson(this);

}