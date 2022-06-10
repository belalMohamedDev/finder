// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateResponse _$UpdateResponseFromJson(Map<String, dynamic> json) =>
    UpdateResponse(
      message: json['message'] as String?,
      statusCode: json['status_code'] as int?,
      user: json['user'] == null
          ? null
          : UserUpdateResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateResponseToJson(UpdateResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status_code': instance.statusCode,
      'user': instance.user,
    };

UserUpdateResponse _$UserUpdateResponseFromJson(Map<String, dynamic> json) =>
    UserUpdateResponse(
      id: json['id'] as int?,
      type: json['type'] as String?,
      attributes: json['attributes'] == null
          ? null
          : AttributesUpdateResponse.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserUpdateResponseToJson(UserUpdateResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'attributes': instance.attributes,
    };

AttributesUpdateResponse _$AttributesUpdateResponseFromJson(
        Map<String, dynamic> json) =>
    AttributesUpdateResponse(
      name: json['name'] as String?,
      nationalId: json['national_id'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phone_number'] as String?,
      picture: json['picture'] as String?,
      pictureUrl: json['picture_url'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$AttributesUpdateResponseToJson(
        AttributesUpdateResponse instance) =>
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
