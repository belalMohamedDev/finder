// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'un_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnReportResponse _$UnReportResponseFromJson(Map<String, dynamic> json) =>
    UnReportResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UnReportResponseToJson(UnReportResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) => DataResponse(
      id: json['id'] as int?,
      type: json['type'] as String?,
      attributes: json['attributes'] == null
          ? null
          : AttributesResponse.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'attributes': instance.attributes,
    };

AttributesResponse _$AttributesResponseFromJson(Map<String, dynamic> json) =>
    AttributesResponse(
      area: json['area'] as String?,
      gender: json['gender'] as String?,
      policeStation: json['police_station'] as String?,
      picture: json['picture'] as String?,
      pictureUrl: json['picture_url'] as String?,
      userId: json['user_id'] as int?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$AttributesResponseToJson(AttributesResponse instance) =>
    <String, dynamic>{
      'area': instance.area,
      'gender': instance.gender,
      'police_station': instance.policeStation,
      'picture': instance.picture,
      'picture_url': instance.pictureUrl,
      'user_id': instance.userId,
      'created_at': instance.createdAt,
    };
