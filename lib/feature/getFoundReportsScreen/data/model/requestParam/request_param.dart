import 'package:json_annotation/json_annotation.dart';
part 'request_param.g.dart';

@JsonSerializable()
class GetFoundReportQueries {
  GetFoundReportQueries({required this.page, required this.limit});
  final int page;
  final int limit;

  //from json
  factory GetFoundReportQueries.fromJson(Map<String, dynamic> json) =>
      _$GetFoundReportQueriesFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$GetFoundReportQueriesToJson(this);
}
