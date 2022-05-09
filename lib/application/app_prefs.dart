import 'package:shared_preferences/shared_preferences.dart';



const String prefsKeyOnBoardingScreenView="PREFS_KEY_ONBOARD_SCREEN_VIEW";
const String prefsKeyIsUserLoggedIn="PREFS_KEY_IS_USER_LOGGED_IN";

const String prefsKeyAccessToken="PREFS_KEY_ACCESS_TOKEN";
const String prefsKeyName="PREFS_KEY_NAME";
const String prefsKeyImage="PREFS_KEY_IMAGE";
const String prefsKeyNationalId="PREFS_KEY_NATIONAL_ID";
const String prefsKeyPhoneNumber="PREFS_KEY_PHONE_NUMBER";




class AppPreferences{
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  //on Boarding screen
Future<void> setOnBoardingScreenView()async{
  _sharedPreferences.setBool(prefsKeyOnBoardingScreenView, true);
}

  Future<bool> isOnBoardingScreenView()async{
   return _sharedPreferences.getBool(prefsKeyOnBoardingScreenView)??false;
  }


  //login screen data
  Future<void> setLoginScreenView()async{
    _sharedPreferences.setBool(prefsKeyIsUserLoggedIn, true);
  }

  Future<bool> isUserLoggedIn()async{
    return _sharedPreferences.getBool(prefsKeyIsUserLoggedIn)??false;
  }

  Future<void> setAccessToken(value)async{
    _sharedPreferences.setString(prefsKeyAccessToken, value);
  }

  Future<String> isAccessToken()async{
    return _sharedPreferences.getString(prefsKeyAccessToken)??"";
  }


  Future<void> setAccessName(value)async{
    _sharedPreferences.setString(prefsKeyName, value);
  }

  Future<String> isAccessName()async{
    return _sharedPreferences.getString(prefsKeyName)??"";
  }

  Future<void> setAccessImage(value)async{
    _sharedPreferences.setString(prefsKeyImage, value);
  }

  Future<String> isAccessImage()async{
    return _sharedPreferences.getString(prefsKeyImage)??"";
  }

  Future<void> setAccessPhoneNumber(value)async{
    _sharedPreferences.setString(prefsKeyPhoneNumber, value);
  }

  Future<String> isAccessPhoneNumber()async{
    return _sharedPreferences.getString(prefsKeyPhoneNumber)??"";
  }

  Future<void> setAccessNationalId(value)async{
    _sharedPreferences.setInt(prefsKeyNationalId, value);
  }

  Future<int> isAccessNationalId()async{
    return _sharedPreferences.getInt(prefsKeyNationalId)??0;
  }
}