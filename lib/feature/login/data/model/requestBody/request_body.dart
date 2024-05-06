import 'package:json_annotation/json_annotation.dart';
part 'request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  LoginRequestBody({required this.phone, required this.password});
  final String phone;
  final String password;

  //from json
  factory LoginRequestBody.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestBodyFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}
