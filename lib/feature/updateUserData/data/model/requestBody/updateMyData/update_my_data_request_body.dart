import 'package:json_annotation/json_annotation.dart';
part 'update_my_data_request_body.g.dart';

@JsonSerializable()
class UpdateMyDataRequestBody {
  UpdateMyDataRequestBody({required this.name,required this.address,required this.phone,});

  final String name;
  final String address;
  final String phone;


  //from json
  factory UpdateMyDataRequestBody.fromJson(Map<String, dynamic> json) =>
      _$UpdateMyDataRequestBodyFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$UpdateMyDataRequestBodyToJson(this);
}
