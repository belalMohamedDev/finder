import 'package:json_annotation/json_annotation.dart';
part 'update_image_request_body.g.dart';

@JsonSerializable()
class UpdateImageRequestBody {
  UpdateImageRequestBody({ required this.image});

  final dynamic image;

  //from json
  factory UpdateImageRequestBody.fromJson(Map<String, dynamic> json) =>
      _$UpdateImageRequestBodyFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$UpdateImageRequestBodyToJson(this);
}
