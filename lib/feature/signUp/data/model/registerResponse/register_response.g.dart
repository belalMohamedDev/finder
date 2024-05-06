// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      token: json['token'] as String?,
      data: json['data'] == null
          ? null
          : DataUser.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'data': instance.data,
    };

DataUser _$DataUserFromJson(Map<String, dynamic> json) => DataUser(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      image: json['image'] as String?,
      address: json['address'] as String?,
      active: json['active'] as bool?,
      sId: json['sId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: json['iV'] as int?,
    );

Map<String, dynamic> _$DataUserToJson(DataUser instance) => <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'password': instance.password,
      'image': instance.image,
      'address': instance.address,
      'active': instance.active,
      'sId': instance.sId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
    };
