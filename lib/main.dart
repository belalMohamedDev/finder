import 'package:finder/application/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'application/app.dart';

import 'presentation/resources/color_manger.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
    statusBarColor: ColorManger.backGround,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(MyApp());
}
