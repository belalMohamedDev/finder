// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_my_password_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePasswordRequestBody _$UpdatePasswordRequestBodyFromJson(
        Map<String, dynamic> json) =>
    UpdatePasswordRequestBody(
      currentPassword: json['currentPassword'] as String,
      password: json['password'] as String,
      passwordConfirm: json['passwordConfirm'] as String,
    );

Map<String, dynamic> _$UpdatePasswordRequestBodyToJson(
        UpdatePasswordRequestBody instance) =>
    <String, dynamic>{
      'currentPassword': instance.currentPassword,
      'password': instance.password,
      'passwordConfirm': instance.passwordConfirm,
    };
