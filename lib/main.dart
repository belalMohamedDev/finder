import 'package:finder/application/di.dart';
import 'package:flutter/material.dart';

import 'application/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}
