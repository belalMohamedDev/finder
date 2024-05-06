// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeAReportRequestBody _$MakeAReportRequestBodyFromJson(
        Map<String, dynamic> json) =>
    MakeAReportRequestBody(
      name: json['name'] as String,
      age: json['age'] as String,
      address: json['address'] as String,
      clothesLastSeenWearing: json['clothesLastSeenWearing'] as String,
      describtion: json['describtion'] as String,
      image: json['image'],
    );

Map<String, dynamic> _$MakeAReportRequestBodyToJson(
        MakeAReportRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'address': instance.address,
      'clothesLastSeenWearing': instance.clothesLastSeenWearing,
      'describtion': instance.describtion,
      'image': instance.image,
    };
