import 'package:json_annotation/json_annotation.dart';
part 'notification_response.g.dart';

@JsonSerializable()
class NotificationResponse {
  int? result;
  int? page;
  bool? status;
  String? message;
  List<DataNotification>? data;

  NotificationResponse({this.result, this.status, this.message, this.data,this.page});

  //from json
  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$NotificationResponseToJson(this);
}

@JsonSerializable()
class DataNotification {
  String? sId;
  String? title;
  MissingNotification? missing;
  UserNotification? user;
  String? createdAt;
  String? updatedAt;
  int? iV;

  FindNotification? find;

  DataNotification(
      {this.sId,
      this.title,
      this.missing,
      this.user,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.find});

  //from json
  factory DataNotification.fromJson(Map<String, dynamic> json) =>
      _$DataNotificationFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$DataNotificationToJson(this);
}

@JsonSerializable()
class UserNotification {
  String? sId;
  String? name;
  String? phone;
  String? password;
  String? address;
  bool? active;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserNotification(
      {this.sId,
      this.name,
      this.phone,
      this.password,
      this.address,
      this.active,
      this.createdAt,
      this.updatedAt,
      this.iV});

  //from json
  factory UserNotification.fromJson(Map<String, dynamic> json) =>
      _$UserNotificationFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$UserNotificationToJson(this);
}


@JsonSerializable()
class MissingNotification {
  String? sId;
  String? name;
  int? age;
  String? address;
  String? clothesLastSeenWearing;
  String? describtion;
  String? image;
  UserNotification? user;
  String? createdAt;
  String? updatedAt;
  int? iV;

  MissingNotification(
      {this.sId,
      this.name,
      this.age,
      this.address,
      this.clothesLastSeenWearing,
      this.describtion,
      this.image,
      this.user,
      this.createdAt,
      this.updatedAt,
      this.iV});


        //from json
  factory MissingNotification.fromJson(Map<String, dynamic> json) =>
      _$MissingNotificationFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$MissingNotificationToJson(this);




}



@JsonSerializable()
class FindNotification {
  String? sId;
  String? address;
  String? image;
  String? description;
  UserNotification? user;
  String? createdAt;
  String? updatedAt;
  int? iV;

  FindNotification(
      {this.sId,
      this.address,
      this.image,
      this.description,
      this.user,
      this.createdAt,
      this.updatedAt,
      this.iV});
        //from json
  factory FindNotification.fromJson(Map<String, dynamic> json) =>
      _$FindNotificationFromJson(json);

  //to json
  Map<String, dynamic> toJson() => _$FindNotificationToJson(this);


}


