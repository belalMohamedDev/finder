// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeAReportOjectRequestBody _$MakeAReportOjectRequestBodyFromJson(
        Map<String, dynamic> json) =>
    MakeAReportOjectRequestBody(
      address: json['address'] as String,
      describtion: json['describtion'] as String,
      image: json['image'],
    );

Map<String, dynamic> _$MakeAReportOjectRequestBodyToJson(
        MakeAReportOjectRequestBody instance) =>
    <String, dynamic>{
      'address': instance.address,
      'describtion': instance.describtion,
      'image': instance.image,
    };
