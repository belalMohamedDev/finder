// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_my_data_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateMyDataRequestBody _$UpdateMyDataRequestBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateMyDataRequestBody(
      name: json['name'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$UpdateMyDataRequestBodyToJson(
        UpdateMyDataRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
    };
