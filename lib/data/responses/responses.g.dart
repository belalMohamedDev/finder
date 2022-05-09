// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponses _$BaseResponsesFromJson(Map<String, dynamic> json) =>
    BaseResponses(
      accessToken: json['access_token'] as String?,
      message: json['message'] as String?,
      statusCode: json['status_code'] as int?,
      user: json['user'] == null
          ? null
          : UserResponses.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaseResponsesToJson(BaseResponses instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'message': instance.message,
      'status_code': instance.statusCode,
      'user': instance.user,
    };

UserResponses _$UserResponsesFromJson(Map<String, dynamic> json) =>
    UserResponses(
      id: json['id'] as int?,
      type: json['type'] as String?,
      attributes: json['attributes'] == null
          ? null
          : AttributesResponses.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponsesToJson(UserResponses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'attributes': instance.attributes,
    };

AttributesResponses _$AttributesResponsesFromJson(Map<String, dynamic> json) =>
    AttributesResponses(
      name: json['name'] as String?,
      nationalId: json['national_id'] as int?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phone_number'] as String?,
      picture: json['picture'] as String?,
      pictureUrl: json['picture_url'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$AttributesResponsesToJson(
        AttributesResponses instance) =>
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
