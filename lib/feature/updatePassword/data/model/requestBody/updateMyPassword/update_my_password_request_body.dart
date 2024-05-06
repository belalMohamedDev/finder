import 'package:json_annotation/json_annotation.dart';
part 'update_my_password_request_body.g.dart';

@JsonSerializable()
class UpdatePasswordRequestBody {
  UpdatePasswordRequestBody({
    required this.currentPassword,
    required this.password,
    required this.passwordConfirm,
  });

  final String currentPassword;
  final String password;
  final String passwordConfirm;

  //from json
  factory UpdatePasswordRequestBody.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordRequestBodyFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$UpdatePasswordRequestBodyToJson(this);
}
