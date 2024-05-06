// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFoundReportQueries _$GetFoundReportQueriesFromJson(
        Map<String, dynamic> json) =>
    GetFoundReportQueries(
      page: json['page'] as int,
      limit: json['limit'] as int,
    );

Map<String, dynamic> _$GetFoundReportQueriesToJson(
        GetFoundReportQueries instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
    };
