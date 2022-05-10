
import 'app_prefs.dart';
import 'di.dart';

final AppPreferences _appPreferences=instance<AppPreferences>();
class Constant {
  static const String baseUrl = "https://8a49-197-36-176-193.eu.ngrok.io";
  static  String token = _appPreferences.isAccessToken();
  static const String empty = "";
  static const int zero = 0;
  static const int apiTimeOut = 60 * 1000;
}
