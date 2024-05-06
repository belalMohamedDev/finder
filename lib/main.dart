import 'package:finder/core/application/di.dart';
import 'package:finder/core/services/pushNotification/firebase_cloud_messaging.dart';
import 'package:finder/core/services/pushNotification/local_notification.dart';

import 'package:finder/finder_app.dart';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
   await Future.delayed(const Duration(seconds: 3));

  WidgetsFlutterBinding.ensureInitialized();

   await initAppModule().then((value) => {
    FirebaseCloudMessaging().init(),
    LocalNotificationService.init()

   });
 
  // Used to make the screen body-less Orientation
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  ).then((_) {
    runApp(MyApp());
  });
}
