import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const settings = InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"));
    await flutterLocalNotificationsPlugin.initialize(settings,
        onDidReceiveNotificationResponse: onTap);
  }

  static void onTap(NotificationResponse notificationResponse) {
    
  }

  static Future<void> showSimpleNotification({required String title,required String body}) async {
    const notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails("finder-id", "finder-name",
            importance: Importance.max, priority: Priority.high));

    await flutterLocalNotificationsPlugin.show(
        0, title, body, notificationDetails);
  }
}
