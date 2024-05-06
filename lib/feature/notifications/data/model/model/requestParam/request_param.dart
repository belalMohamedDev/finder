import 'package:json_annotation/json_annotation.dart';
part 'request_param.g.dart';

@JsonSerializable()
class GetNotificationQueries {
  GetNotificationQueries({required this.page, required this.limit});
  final int page;
  final int limit;

  //from json
  factory GetNotificationQueries.fromJson(Map<String, dynamic> json) =>
      _$GetNotificationQueriesFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$GetNotificationQueriesToJson(this);
}
