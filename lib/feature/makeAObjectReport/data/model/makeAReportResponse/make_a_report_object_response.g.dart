// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make_a_report_object_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeAReportObjectResopnse _$MakeAReportObjectResopnseFromJson(
        Map<String, dynamic> json) =>
    MakeAReportObjectResopnse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : MakeAReportObjectData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MakeAReportObjectResopnseToJson(
        MakeAReportObjectResopnse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

MakeAReportObjectData _$MakeAReportObjectDataFromJson(
        Map<String, dynamic> json) =>
    MakeAReportObjectData(
      address: json['address'] as String?,
      describtion: json['describtion'] as String?,
      image: json['image'] as String?,
      user: json['user'] as String?,
      sId: json['sId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: json['iV'] as int?,
    );

Map<String, dynamic> _$MakeAReportObjectDataToJson(
        MakeAReportObjectData instance) =>
    <String, dynamic>{
      'address': instance.address,
      'describtion': instance.describtion,
      'image': instance.image,
      'user': instance.user,
      'sId': instance.sId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
    };
