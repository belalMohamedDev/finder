import 'package:shared_preferences/shared_preferences.dart';

const String prefsKeyOnBoardingScreenView = "PREFS_KEY_ONBOARD_SCREEN_VIEW";
const String prefsKeyIsUserLoggedIn = "PREFS_KEY_IS_USER_LOGGED_IN";

const String prefsKeyAccessToken = "PREFS_KEY_ACCESS_TOKEN";
const String prefsKeyName = "PREFS_KEY_NAME";
const String prefsKeyImage = "PREFS_KEY_IMAGE";
const String prefsKeyNationalId = "PREFS_KEY_NATIONAL_ID";
const String prefsKeyId = "prefsKeyId";
const String prefsKeyPhoneNumber = "PREFS_KEY_PHONE_NUMBER";
const String prefsKeyAddress = "PREFS_KEY_Address";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

//Clear  data from application
  removeData() {
    _sharedPreferences.remove(prefsKeyAccessToken); //clear token
    _sharedPreferences.remove(prefsKeyName); //clear name
    _sharedPreferences.remove(prefsKeyImage); //clear image
    _sharedPreferences.remove(prefsKeyNationalId); //clear national
    _sharedPreferences.remove(prefsKeyPhoneNumber); // clear phone
    _sharedPreferences.remove(prefsKeyAddress);  // clear address
    _sharedPreferences.remove(prefsKeyIsUserLoggedIn); // clear bool data in login
    _sharedPreferences.remove(prefsKeyId); // clear id
  }

  //on Boarding screen
  Future<void> setOnBoardingScreenView() async {
    _sharedPreferences.setBool(prefsKeyOnBoardingScreenView, true);
  }

  Future<bool> isOnBoardingScreenView() async {
    return _sharedPreferences.getBool(prefsKeyOnBoardingScreenView) ?? false;
  }

  //login screen data

  Future<void> setLoginScreenView() async {
    _sharedPreferences.setBool(prefsKeyIsUserLoggedIn, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(prefsKeyIsUserLoggedIn) ?? false;
  }

  //set login screen data
  Future<void> setLoginScreenData(
      {required String tokenValue,
        required String nameValue,
        required String phoneValue,
        required String imageValue,
        required String addressValue,
        required int nationalIdValue,
        required int id,

      }) async {
    _sharedPreferences.setString(prefsKeyAccessToken, tokenValue);
    _sharedPreferences.setString(prefsKeyName, nameValue);
    _sharedPreferences.setString(prefsKeyPhoneNumber, phoneValue);
    _sharedPreferences.setString(prefsKeyImage, imageValue);
    _sharedPreferences.setString(prefsKeyAddress, addressValue);
    _sharedPreferences.setInt(prefsKeyNationalId, nationalIdValue);
    _sharedPreferences.setInt(prefsKeyId, id);

  }


  String isAccessToken() {
    return _sharedPreferences.getString(prefsKeyAccessToken) ?? "";
  }


  String isAccessName() {
    return _sharedPreferences.getString(prefsKeyName) ?? "";
  }

  String isAccessImage() {
    return _sharedPreferences.getString(prefsKeyImage) ?? "";
  }


  String isAccessPhoneNumber() {
    return _sharedPreferences.getString(prefsKeyPhoneNumber) ?? "";
  }

  String isAccessAddress() {
    return _sharedPreferences.getString(prefsKeyAddress) ?? "";
  }

  int isAccessNationalId() {
    return _sharedPreferences.getInt(prefsKeyNationalId) ?? 0;
  }

  int isAccessId() {
    return _sharedPreferences.getInt(prefsKeyId) ?? 0;
  }
}
