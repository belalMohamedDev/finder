class AiResponse {
  AiResponse({
    required this.result,
    required this.statusCode,
  });
    String? result;
    int? statusCode;

  AiResponse.fromJson(Map<String, dynamic> json){
    result = json['result'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['result'] = result;
    _data['status_code'] = statusCode;
    return _data;
  }
}