
import 'package:json_annotation/json_annotation.dart';
part 'request_body.g.dart';

@JsonSerializable()
class AiRequestBody{

  AiRequestBody({
  required this.image
  });

  
  final dynamic image ;


    //from json
    factory AiRequestBody.fromJson(Map<String, dynamic> json) =>
      _$AiRequestBodyFromJson(json);


  //to json
  Map<String, dynamic> toJson() => _$AiRequestBodyToJson(this);

}




