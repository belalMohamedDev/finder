// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiResponse _$AiResponseFromJson(Map<String, dynamic> json) => AiResponse(
      message: json['message'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$AiResponseToJson(AiResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
