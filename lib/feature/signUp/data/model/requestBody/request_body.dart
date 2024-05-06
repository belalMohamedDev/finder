
import 'package:json_annotation/json_annotation.dart';
part 'request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody{

  RegisterRequestBody({required this.name, required this.phone,required this.password, required this.address,
  required this.image
  });
  final String name;
  final String phone;
  final String password;
  
  final String address;
  
  final dynamic image ;


    //from json
    factory RegisterRequestBody.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestBodyFromJson(json);


  //to json
  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);

}





