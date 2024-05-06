// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'missing_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMissingResopnse _$GetMissingResopnseFromJson(Map<String, dynamic> json) =>
    GetMissingResopnse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      result: json['result'] as int?,
      page: json['page'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GetMissingData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetMissingResopnseToJson(GetMissingResopnse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'result': instance.result,
      'page': instance.page,
      'data': instance.data,
    };

GetMissingData _$GetMissingDataFromJson(Map<String, dynamic> json) =>
    GetMissingData(
      sId: json['sId'] as String?,
      name: json['name'] as String?,
      age: json['age'] as int?,
      address: json['address'] as String?,
      clothesLastSeenWearing: json['clothesLastSeenWearing'] as String?,
      describtion: json['describtion'] as String?,
      image: json['image'] as String?,
      user: json['user'] == null
          ? null
          : UserMssinData.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: json['iV'] as int?,
    );

Map<String, dynamic> _$GetMissingDataToJson(GetMissingData instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'name': instance.name,
      'age': instance.age,
      'address': instance.address,
      'clothesLastSeenWearing': instance.clothesLastSeenWearing,
      'describtion': instance.describtion,
      'image': instance.image,
      'user': instance.user,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
    };

UserMssinData _$UserMssinDataFromJson(Map<String, dynamic> json) =>
    UserMssinData(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$UserMssinDataToJson(UserMssinData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
    };
