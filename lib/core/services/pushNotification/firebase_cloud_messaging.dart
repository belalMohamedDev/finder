import 'package:finder/core/services/pushNotification/firebase_messaging_navig.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseCloudMessaging {
  factory FirebaseCloudMessaging() => _instance;
  FirebaseCloudMessaging._();
  final _firebaseMessaging = FirebaseMessaging.instance;
  ValueNotifier<bool> isNotificationSubscribe = ValueNotifier(true);
  ValueNotifier<bool> recieveNotification = ValueNotifier(false);
  bool isPermissionNotification = false;

  static final FirebaseCloudMessaging _instance = FirebaseCloudMessaging._();

  static const String subscribeKey = 'finder';

  Future<void> init() async {
    //permission
    await _permissionsNotification();

    //forground
    FirebaseMessaging.onMessage
        .listen(FirebaseMessagingNavigator.foreGroundHandler);


   
  }

  /// controller for the notification if user subscribe or unsubscribed
  /// or accpeted the permission or not

  Future<void> controllerForUserSubscribe(BuildContext context) async {
    if (isPermissionNotification == false) {
      await _permissionsNotification();
    } else {
      if (isNotificationSubscribe.value == false) {
        await _subscribeNotification();
      } else {
        await _unSubscribeNotification();
      }
    }
  }

  /// subscribe notification
  Future<void> _subscribeNotification() async {
    isNotificationSubscribe.value = true;
    await FirebaseMessaging.instance.subscribeToTopic(subscribeKey);
    debugPrint('====🔔 Notification Subscribed 🔔=====');
  }

  /// unsubscribe notification

  Future<void> _unSubscribeNotification() async {
    isNotificationSubscribe.value = false;
    await FirebaseMessaging.instance.unsubscribeFromTopic(subscribeKey);
    debugPrint('====🔕 Notification Unsubscribed 🔕=====');
  }

  /// permissions to notifications
  Future<void> _permissionsNotification() async {
    final settings = await _firebaseMessaging.requestPermission(badge: false);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      /// subscribe to notifications topic
      isPermissionNotification = true;
      await _subscribeNotification();
      debugPrint('🔔🔔 User accepted the notification permission');
    } else {
      isPermissionNotification = false;
      isNotificationSubscribe.value = false;
      debugPrint('🔕🔕 User not accepted the notification permission');
    }
  }
}
