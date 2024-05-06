// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNotificationQueries _$GetNotificationQueriesFromJson(
        Map<String, dynamic> json) =>
    GetNotificationQueries(
      page: json['page'] as int,
      limit: json['limit'] as int,
    );

Map<String, dynamic> _$GetNotificationQueriesToJson(
        GetNotificationQueries instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
    };
