class ApiConstants {
   static const String baseUrl = 'http://192.168.182.2:8080';
   static const int apiTimeOut = 120 * 1000;

  static const String login = '/v1/api/auth/login';
  static const String signup = '/v1/api/auth/signUp';
  static const String ai = '/v1/api/ai';
  static const String getMissing = '/v1/api/missing';
  static const String getFound = '/v1/api/find';
  static const String updateMyImage = '/v1/api/user/updateMyImage';
  static const String updateMyPassword = '/v1/api/user/updateMyPassword';
  static const String updateMyData = '/v1/api/user/updateMyData';
  static const String getNotification = '/v1/api/notification';
}
