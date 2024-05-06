// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataModelResponse _$UserDataModelResponseFromJson(
        Map<String, dynamic> json) =>
    UserDataModelResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
    )..token = json['token'] as String?;

Map<String, dynamic> _$UserDataModelResponseToJson(
        UserDataModelResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'data': instance.data,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      sId: json['sId'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      image: json['image'] as String?,
      address: json['address'] as String?,
      active: json['active'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: json['iV'] as int?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'sId': instance.sId,
      'name': instance.name,
      'phone': instance.phone,
      'password': instance.password,
      'image': instance.image,
      'address': instance.address,
      'active': instance.active,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
    };
