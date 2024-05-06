// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationResponse _$NotificationResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationResponse(
      result: json['result'] as int?,
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataNotification.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int?,
    );

Map<String, dynamic> _$NotificationResponseToJson(
        NotificationResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'page': instance.page,
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

DataNotification _$DataNotificationFromJson(Map<String, dynamic> json) =>
    DataNotification(
      sId: json['sId'] as String?,
      title: json['title'] as String?,
      missing: json['missing'] == null
          ? null
          : MissingNotification.fromJson(
              json['missing'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserNotification.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: json['iV'] as int?,
      find: json['find'] == null
          ? null
          : FindNotification.fromJson(json['find'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataNotificationToJson(DataNotification instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'title': instance.title,
      'missing': instance.missing,
      'user': instance.user,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
      'find': instance.find,
    };

UserNotification _$UserNotificationFromJson(Map<String, dynamic> json) =>
    UserNotification(
      sId: json['sId'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      address: json['address'] as String?,
      active: json['active'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: json['iV'] as int?,
    );

Map<String, dynamic> _$UserNotificationToJson(UserNotification instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'name': instance.name,
      'phone': instance.phone,
      'password': instance.password,
      'address': instance.address,
      'active': instance.active,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
    };

MissingNotification _$MissingNotificationFromJson(Map<String, dynamic> json) =>
    MissingNotification(
      sId: json['sId'] as String?,
      name: json['name'] as String?,
      age: json['age'] as int?,
      address: json['address'] as String?,
      clothesLastSeenWearing: json['clothesLastSeenWearing'] as String?,
      describtion: json['describtion'] as String?,
      image: json['image'] as String?,
      user: json['user'] == null
          ? null
          : UserNotification.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: json['iV'] as int?,
    );

Map<String, dynamic> _$MissingNotificationToJson(
        MissingNotification instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'name': instance.name,
      'age': instance.age,
      'address': instance.address,
      'clothesLastSeenWearing': instance.clothesLastSeenWearing,
      'describtion': instance.describtion,
      'image': instance.image,
      'user': instance.user,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
    };

FindNotification _$FindNotificationFromJson(Map<String, dynamic> json) =>
    FindNotification(
      sId: json['sId'] as String?,
      address: json['address'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      user: json['user'] == null
          ? null
          : UserNotification.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: json['iV'] as int?,
    );

Map<String, dynamic> _$FindNotificationToJson(FindNotification instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'address': instance.address,
      'image': instance.image,
      'description': instance.description,
      'user': instance.user,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
    };
