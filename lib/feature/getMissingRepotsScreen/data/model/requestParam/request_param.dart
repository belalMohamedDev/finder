import 'package:json_annotation/json_annotation.dart';
part 'request_param.g.dart';

@JsonSerializable()
class GetMissingReportQueries {
  GetMissingReportQueries({required this.page, required this.limit});
  final int page;
  final int limit;

  //from json
  factory GetMissingReportQueries.fromJson(Map<String, dynamic> json) =>
      _$GetMissingReportQueriesFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$GetMissingReportQueriesToJson(this);
}
