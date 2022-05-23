// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make_un_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeUnReportResponse _$MakeUnReportResponseFromJson(
        Map<String, dynamic> json) =>
    MakeUnReportResponse(
      message: json['message'] as String?,
      statusCode: json['status_code'] as int?,
      unreportedIncident: json['unreported_incident'] == null
          ? null
          : UnreportedIncidentResponse.fromJson(
              json['unreported_incident'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MakeUnReportResponseToJson(
        MakeUnReportResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status_code': instance.statusCode,
      'unreported_incident': instance.unreportedIncident,
    };

UnreportedIncidentResponse _$UnreportedIncidentResponseFromJson(
        Map<String, dynamic> json) =>
    UnreportedIncidentResponse(
      id: json['id'] as int?,
      type: json['type'] as String?,
      attributes: json['attributes'] == null
          ? null
          : AttributesMakeUnReportResponse.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UnreportedIncidentResponseToJson(
        UnreportedIncidentResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'attributes': instance.attributes,
    };

AttributesMakeUnReportResponse _$AttributesMakeUnReportResponseFromJson(
        Map<String, dynamic> json) =>
    AttributesMakeUnReportResponse(
      area: json['area'] as String?,
      gender: json['gender'] as String?,
      policeStation: json['police_station'] as String?,
      picture: json['picture'] as String?,
      pictureUrl: json['picture_url'] as String?,
      userId: json['user_id'] as int?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$AttributesMakeUnReportResponseToJson(
        AttributesMakeUnReportResponse instance) =>
    <String, dynamic>{
      'area': instance.area,
      'gender': instance.gender,
      'police_station': instance.policeStation,
      'picture': instance.picture,
      'picture_url': instance.pictureUrl,
      'user_id': instance.userId,
      'created_at': instance.createdAt,
    };
