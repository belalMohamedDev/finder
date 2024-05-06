// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestBody _$RegisterRequestBodyFromJson(Map<String, dynamic> json) =>
    RegisterRequestBody(
      name: json['name'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
      address: json['address'] as String,
      image: json['image'],
    );

Map<String, dynamic> _$RegisterRequestBodyToJson(
        RegisterRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'password': instance.password,
      'address': instance.address,
      'image': instance.image,
    };
