import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

const baseUrl = kReleaseMode
    ? "https://speedreaderbackend.azurewebsites.net/"
    : "https://speedreaderbackend.azurewebsites.net/";

class ApiProvider {
  static final ApiProvider _apiProvider = ApiProvider._internal();
  final dio = Dio();
  final tokenDio = Dio();
  final keyToken = 'access_token';
  final keyTokenRefresh = 'refresh_token';
  final accountId = 'account_id';
  final firstName = 'firstName';
  final lastName = 'lastName';

  Interceptor? _authInterceptor;

  factory ApiProvider() {
    return _apiProvider;
  }

  ApiProvider._internal() {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 100);
    dio.options.receiveTimeout = const Duration(seconds: 100);
    dio.transformer = SyncTransformer(jsonDecodeCallback: _tryParseJson);

    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
          requestHeader: false, responseBody: true, requestBody: true));
      tokenDio.interceptors
          .add(LogInterceptor(requestHeader: false, responseBody: true));
    }
  }
  void setRefreshToken({String? token, @required String? refreshToken}) {
    if (_authInterceptor != null) {
      dio.interceptors.remove(_authInterceptor);
    }
    _authInterceptor = _AuthInterceptor(dio, () => getToken(refreshToken ?? ''),
        token: token ?? '') as Interceptor?;
    dio.interceptors.insert(0, _authInterceptor!);
  }

  Future<String> getToken(String refreshToken) async {
    final response = await tokenDio.request('api/connect/token',
        options: Options(
          method: "POST",
          contentType: Headers.formUrlEncodedContentType,
        ),
        data: {
          "grant_type": "refresh_token",
          "client_id": "user",
          "admin"
              "client_secret": "291bf515-3684-4c37-bd1a-59325e76810b",
          "37f8002c-2206-4182-8278-c2af7b5aa108"
              "scope": "offline_access"
        });
    final token = response.data['access_token'];
    return "Bearer $token";
  }
}

class _AuthInterceptor extends Interceptors {
  late FutureOr<String> _tokenFuture;
  final Future<String> Function() _tokenSupplier;
  final Dio _dio;
  _AuthInterceptor(this._dio, this._tokenSupplier, {required String token}) {
    _tokenFuture = token;
  }
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    _tokenFuture;
    final future = _tokenFuture;

    try {
      options.headers['Authorization'] = await _tokenFuture;
    } on DioException catch (err) {
      if (err.type != DioExceptionType.badResponse) {
        if (future == _tokenFuture) {
          _tokenFuture = '';
        }
      }
      handler.reject(err);
      return;
    }
    handler.next(options);
  }

  static const _refreshedExtra = "refreshed";

  @override
  Future<void> OnError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401 ||
        err.requestOptions.extra[_refreshedExtra] == true) {
      handler.next(err);
      return;
    }
    final future = _tokenFuture;
    var token = await future;

    final options = err.requestOptions;

    if (future == _tokenFuture && token == options.headers['Authorization']) {
// Token hasn't refreshed yet: refresh it now.
      _tokenFuture = _tokenSupplier();
    }
    if (future != _tokenFuture) {
      token = await _tokenFuture;
    }
    options.headers['Authorization'] = token;
    options.extra[_refreshedExtra] = true;
    try {
      handler.resolve(await _dio.fetch(options));
    } on DioException catch (err) {
      handler.next(err);
    }
  }
}

dynamic _tryParseJson(String value) {
  try {
    return json.decode(value);
  } on FormatException {
    return value;
  }
}
