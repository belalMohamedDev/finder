// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make_a_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeAReportResopnse _$MakeAReportResopnseFromJson(Map<String, dynamic> json) =>
    MakeAReportResopnse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : MakeAReportData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MakeAReportResopnseToJson(
        MakeAReportResopnse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

MakeAReportData _$MakeAReportDataFromJson(Map<String, dynamic> json) =>
    MakeAReportData(
      name: json['name'] as String?,
      age: json['age'] as int?,
      address: json['address'] as String?,
      clothesLastSeenWearing: json['clothesLastSeenWearing'] as String?,
      describtion: json['describtion'] as String?,
      image: json['image'] as String?,
      user: json['user'] as String?,
      sId: json['sId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: json['iV'] as int?,
    );

Map<String, dynamic> _$MakeAReportDataToJson(MakeAReportData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'address': instance.address,
      'clothesLastSeenWearing': instance.clothesLastSeenWearing,
      'describtion': instance.describtion,
      'image': instance.image,
      'user': instance.user,
      'sId': instance.sId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
    };
