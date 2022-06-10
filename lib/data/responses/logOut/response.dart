class LogOutResponse {
  String? message;
  int? statusCode;

  LogOutResponse({this.message, this.statusCode});

  LogOutResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['message'] = message;
    data['status_code'] = statusCode;
    return data;
  }
}