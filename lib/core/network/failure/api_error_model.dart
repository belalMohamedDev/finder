import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {

  ApiErrorModel({
    required this.message,
    this.statusCode,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);
  final String? message;
  final int? statusCode;

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}