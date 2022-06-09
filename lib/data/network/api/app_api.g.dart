// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _AppServiceClient implements AppServiceClient {
  _AppServiceClient(this._dio, {this.baseUrl}) {
    baseUrl ??= Constant.baseUrl;
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BaseResponses> login(nationalId, password) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'national_id': nationalId, 'password': password};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponses>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/login',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponses.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RegisterModelResponse> register(
      name, nationalId, email, password, address, phoneNumber, picture) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    FormData _data = FormData.fromMap({
      'name': name,
      'national_id': nationalId,
      'email': email,
      'password': password,
      'address': address,
      'phone_number': phoneNumber,
      'picture': picture
    });
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RegisterModelResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/register',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RegisterModelResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ReportResponse> getReports() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ReportResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/reports',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ReportResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UnReportResponse> getUnReports() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UnReportResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/unreportedincidents',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UnReportResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LogOutResponse> logOut() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LogOutResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/logout',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LogOutResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MakeReportResponse> makeReport(name, nationalId, age, area, gender,
      picture, clothesLastSeenWearing, birthmark) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    FormData _data = FormData.fromMap({
      'name': name,
      'national_id': nationalId,
      'age': age,
      'area': area,
      'gender': gender,
      'picture': picture,
      'clothes_last_seen_wearing': clothesLastSeenWearing,
      'birthmark': birthmark
    });
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MakeReportResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/reports',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MakeReportResponse.fromJson(_result.data!);
    return value;
  }



  @override
  Future<IncidentResponse> incident(
      area, gender, policeStation, picture) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    FormData _data = FormData.fromMap({
      'area': area,
      'gender': gender,
      'police_station': policeStation,
      'picture': picture
    });
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<IncidentResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/unreportedincidents',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = IncidentResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UpdateResponse> updateUser(
      {required name,
      required nationalId,
      required email,
      required password,
      required address,
      required phoneNumber,
      required picture,
      method = "put"}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    FormData _data = FormData.fromMap({
      'name': name,
      'national_id': nationalId,
      'email': email,
      'password': password,
      'address': address,
      'phone_number': phoneNumber,
      'picture': picture,
      '_method': method
    });
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UpdateResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/users',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UpdateResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
