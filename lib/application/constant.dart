
import 'app_prefs.dart';
import 'di.dart';

final AppPreferences _appPreferences=instance<AppPreferences>();
class Constant {
  static const String baseUrl = "https://3db8-197-36-114-250.eu.ngrok.io";
  static  String token = _appPreferences.isAccessToken();
  static const String empty = "";
  static const int zero = 0;
  static const List listEmpty = [];
  static const int apiTimeOut = 120 * 1000;
}
