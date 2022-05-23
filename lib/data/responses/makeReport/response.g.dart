// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeReportResponse _$MakeReportResponseFromJson(Map<String, dynamic> json) =>
    MakeReportResponse(
      message: json['message'] as String?,
      statusCode: json['status_code'] as int?,
      report: json['report'] == null
          ? null
          : ReportDataResponse.fromJson(json['report'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MakeReportResponseToJson(MakeReportResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status_code': instance.statusCode,
      'report': instance.report,
    };

ReportDataResponse _$ReportDataResponseFromJson(Map<String, dynamic> json) =>
    ReportDataResponse(
      id: json['id'] as int?,
      type: json['type'] as String?,
      attributes: json['attributes'] == null
          ? null
          : AttributesResponse.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReportDataResponseToJson(ReportDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'attributes': instance.attributes,
    };

AttributesResponse _$AttributesResponseFromJson(Map<String, dynamic> json) =>
    AttributesResponse(
      name: json['name'] as String?,
      nationalId: json['national_id'] as String?,
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

Map<String, dynamic> _$AttributesResponseToJson(AttributesResponse instance) =>
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
