// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeUnReportRequestBody _$MakeUnReportRequestBodyFromJson(
        Map<String, dynamic> json) =>
    MakeUnReportRequestBody(
      address: json['address'] as String,
      description: json['description'] as String,
      image: json['image'],
    );

Map<String, dynamic> _$MakeUnReportRequestBodyToJson(
        MakeUnReportRequestBody instance) =>
    <String, dynamic>{
      'address': instance.address,
      'description': instance.description,
      'image': instance.image,
    };
