import 'package:finder/core/services/pushNotification/firebase_cloud_messaging.dart';
import 'package:finder/core/services/pushNotification/local_notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingNavigator {
  //forground
  static Future<void> foreGroundHandler(RemoteMessage? remoteMessage) async {
     FirebaseCloudMessaging().recieveNotification.value = true;
    if (remoteMessage != null) {
      await LocalNotificationService.showSimpleNotification(
          title: remoteMessage.notification!.title!,
          body: remoteMessage.notification!.body!);
    }
  }



}
