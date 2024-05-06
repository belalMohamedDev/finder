// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      token: json['token'] as String?,
      data: json['data'] == null
          ? null
          : DataUser.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'data': instance.data,
    };

DataUser _$DataUserFromJson(Map<String, dynamic> json) => DataUser(
      sId: json['sId'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      address: json['address'] as String?,
      image: json['image'] as String?,
      active: json['active'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: json['iV'] as int?,
      passwordChangedAt: json['passwordChangedAt'] as String?,
    );

Map<String, dynamic> _$DataUserToJson(DataUser instance) => <String, dynamic>{
      'sId': instance.sId,
      'name': instance.name,
      'phone': instance.phone,
      'password': instance.password,
      'address': instance.address,
      'image': instance.image,
      'active': instance.active,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
      'passwordChangedAt': instance.passwordChangedAt,
    };
