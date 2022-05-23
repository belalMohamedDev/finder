// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModelResponse _$RegisterModelResponseFromJson(
        Map<String, dynamic> json) =>
    RegisterModelResponse(
      message: json['message'] as String?,
      statusCode: json['status_code'] as int?,
      user: json['user'] == null
          ? null
          : UserRegisterResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterModelResponseToJson(
        RegisterModelResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status_code': instance.statusCode,
      'user': instance.user,
    };

UserRegisterResponse _$UserRegisterResponseFromJson(
        Map<String, dynamic> json) =>
    UserRegisterResponse(
      id: json['id'] as int?,
      type: json['type'] as String?,
      attributes: json['attributes'] == null
          ? null
          : AttributesRegisterResponse.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserRegisterResponseToJson(
        UserRegisterResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'attributes': instance.attributes,
    };

AttributesRegisterResponse _$AttributesRegisterResponseFromJson(
        Map<String, dynamic> json) =>
    AttributesRegisterResponse(
      name: json['name'] as String?,
      nationalId: json['national_id'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phone_number'] as String?,
      picture: json['picture'] as String?,
      pictureUrl: json['picture_url'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$AttributesRegisterResponseToJson(
        AttributesRegisterResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'national_id': instance.nationalId,
      'email': instance.email,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
      'picture': instance.picture,
      'picture_url': instance.pictureUrl,
      'created_at': instance.createdAt,
    };
