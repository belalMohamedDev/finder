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
const String prefsKeyEmail = "prefsKeyEmail";
const String prefsKeyPassword = "prefsKeyPassword";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

//Clear  data from application
 Future<void> removeData() async{
    _sharedPreferences.remove(prefsKeyAccessToken); //clear token
    _sharedPreferences.remove(prefsKeyName); //clear name
    _sharedPreferences.remove(prefsKeyImage); //clear image
    _sharedPreferences.remove(prefsKeyNationalId); //clear national
    _sharedPreferences.remove(prefsKeyPhoneNumber); // clear phone
    _sharedPreferences.remove(prefsKeyAddress);  // clear address
    _sharedPreferences.remove(prefsKeyIsUserLoggedIn); // clear bool data in login
    _sharedPreferences.remove(prefsKeyId); // clear id
    _sharedPreferences.remove(prefsKeyEmail); // clear id
    _sharedPreferences.remove(prefsKeyPassword); // clear id

  }

  //on Boarding screen
  Future<void> setOnBoardingScreenView() async {
   await _sharedPreferences.setBool(prefsKeyOnBoardingScreenView, true);
  }

  Future<bool> isOnBoardingScreenView() async {
    return _sharedPreferences.getBool(prefsKeyOnBoardingScreenView) ?? false;
  }

  //login screen data

  Future<void> setLoginScreenView() async {
   await _sharedPreferences.setBool(prefsKeyIsUserLoggedIn, true);
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
        required String password,
        required String email,
        required int id,

      }) async {
   await _sharedPreferences.setString(prefsKeyAccessToken, tokenValue);
  await  _sharedPreferences.setString(prefsKeyName, nameValue);
  await  _sharedPreferences.setString(prefsKeyPhoneNumber, phoneValue);
  await  _sharedPreferences.setString(prefsKeyImage, imageValue);
   await _sharedPreferences.setString(prefsKeyAddress, addressValue);
   await  _sharedPreferences.setString(prefsKeyEmail, email);
   await _sharedPreferences.setString(prefsKeyPassword, password);
   await _sharedPreferences.setInt(prefsKeyNationalId, nationalIdValue);
   await _sharedPreferences.setInt(prefsKeyId, id);

  }


  String isAccessToken() {
    return  _sharedPreferences.getString(prefsKeyAccessToken) ?? "";
  }

  String isAccessEmail() {
    return  _sharedPreferences.getString(prefsKeyEmail) ?? "";
  }

  String isAccessPassword() {
    return  _sharedPreferences.getString(prefsKeyPassword) ?? "";
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
