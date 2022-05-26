// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeSpecificUnReportResponse _$MakeSpecificUnReportResponseFromJson(
        Map<String, dynamic> json) =>
    MakeSpecificUnReportResponse(
      data: json['data'] == null
          ? null
          : DataMakeSpecificUnReportResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MakeSpecificUnReportResponseToJson(
        MakeSpecificUnReportResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DataMakeSpecificUnReportResponse _$DataMakeSpecificUnReportResponseFromJson(
        Map<String, dynamic> json) =>
    DataMakeSpecificUnReportResponse(
      id: json['id'] as int?,
      type: json['type'] as String?,
      attributes: json['attributes'] == null
          ? null
          : AttributesMakeSpecificUnReportResponse.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataMakeSpecificUnReportResponseToJson(
        DataMakeSpecificUnReportResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'attributes': instance.attributes,
    };

AttributesMakeSpecificUnReportResponse
    _$AttributesMakeSpecificUnReportResponseFromJson(
            Map<String, dynamic> json) =>
        AttributesMakeSpecificUnReportResponse(
          area: json['area'] as String?,
          gender: json['gender'] as String?,
          policeStation: json['police_station'] as String?,
          picture: json['picture'] as String?,
          pictureUrl: json['picture_url'] as String?,
          userId: json['user_id'] as int?,
          createdAt: json['created_at'] as String?,
        );

Map<String, dynamic> _$AttributesMakeSpecificUnReportResponseToJson(
        AttributesMakeSpecificUnReportResponse instance) =>
    <String, dynamic>{
      'area': instance.area,
      'gender': instance.gender,
      'police_station': instance.policeStation,
      'picture': instance.picture,
      'picture_url': instance.pictureUrl,
      'user_id': instance.userId,
      'created_at': instance.createdAt,
    };
