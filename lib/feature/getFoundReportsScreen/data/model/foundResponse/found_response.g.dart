// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'found_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFoundResopnse _$GetFoundResopnseFromJson(Map<String, dynamic> json) =>
    GetFoundResopnse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      result: json['result'] as int?,
      page: json['page'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GetFoundData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetFoundResopnseToJson(GetFoundResopnse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'result': instance.result,
      'page': instance.page,
      'data': instance.data,
    };

GetFoundData _$GetFoundDataFromJson(Map<String, dynamic> json) => GetFoundData(
      sId: json['sId'] as String?,
      address: json['address'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      user: json['user'] == null
          ? null
          : UserFoundData.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: json['iV'] as int?,
    );

Map<String, dynamic> _$GetFoundDataToJson(GetFoundData instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'address': instance.address,
      'image': instance.image,
      'description': instance.description,
      'user': instance.user,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
    };

UserFoundData _$UserFoundDataFromJson(Map<String, dynamic> json) =>
    UserFoundData(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$UserFoundDataToJson(UserFoundData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
    };
