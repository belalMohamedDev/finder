// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make_un_report_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeUnReportResponse _$MakeUnReportResponseFromJson(
        Map<String, dynamic> json) =>
    MakeUnReportResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DataMakeUnReportResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MakeUnReportResponseToJson(
        MakeUnReportResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

DataMakeUnReportResponse _$DataMakeUnReportResponseFromJson(
        Map<String, dynamic> json) =>
    DataMakeUnReportResponse(
      address: json['address'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      user: json['user'] as String?,
      sId: json['sId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$DataMakeUnReportResponseToJson(
        DataMakeUnReportResponse instance) =>
    <String, dynamic>{
      'address': instance.address,
      'image': instance.image,
      'description': instance.description,
      'user': instance.user,
      'sId': instance.sId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
