// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeSpecificReportResponse _$MakeSpecificReportResponseFromJson(
        Map<String, dynamic> json) =>
    MakeSpecificReportResponse(
      data: json['data'] == null
          ? null
          : DataMakeSpecificReportResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MakeSpecificReportResponseToJson(
        MakeSpecificReportResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DataMakeSpecificReportResponse _$DataMakeSpecificReportResponseFromJson(
        Map<String, dynamic> json) =>
    DataMakeSpecificReportResponse(
      id: json['id'] as int?,
      type: json['type'] as String?,
      attributes: json['attributes'] == null
          ? null
          : AttributesMakeSpecificReportResponse.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataMakeSpecificReportResponseToJson(
        DataMakeSpecificReportResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'attributes': instance.attributes,
    };

AttributesMakeSpecificReportResponse
    _$AttributesMakeSpecificReportResponseFromJson(Map<String, dynamic> json) =>
        AttributesMakeSpecificReportResponse(
          name: json['name'] as String?,
          nationalId: json['national_id'] as int?,
          age: json['age'] as String?,
          area: json['area'] as String?,
          clothesLastSeenWearing: json['clothes_last_seen_wearing'] as String?,
          gender: json['gender'] as String?,
          birthmark: json['birthmark'] as String?,
          picture: json['picture'] as String?,
          pictureUrl: json['picture_url'] as String?,
          userId: json['user_id'] as int?,
          createdAt: json['created_at'] as String?,
        );

Map<String, dynamic> _$AttributesMakeSpecificReportResponseToJson(
        AttributesMakeSpecificReportResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'national_id': instance.nationalId,
      'age': instance.age,
      'area': instance.area,
      'clothes_last_seen_wearing': instance.clothesLastSeenWearing,
      'gender': instance.gender,
      'birthmark': instance.birthmark,
      'picture': instance.picture,
      'picture_url': instance.pictureUrl,
      'user_id': instance.userId,
      'created_at': instance.createdAt,
    };
