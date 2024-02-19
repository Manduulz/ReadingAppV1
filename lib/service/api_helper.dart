import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

import 'method.dart';
import 'my_storage.dart';

class ApiHelper {
  final Dio _dio = Dio();
  static final ApiHelper _instance = ApiHelper._internal();

  factory ApiHelper() => _instance;
  ApiHelper._internal();

  static ApiHelper get instance => _instance;

  ///Init RestAPI client. This method must be called before using [ApiHelper]. If not, [ApiHelper] will throw error
  ///
  /// [baseUrl] -> base url for api
  Future<void> init({required String baseUrl}) async {
    assert(Uri.parse(baseUrl).isAbsolute);
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);

    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final HttpClient client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

      return client;
    };
  }

  @Deprecated('Use sendHttpRequest instead')

  ///Send request to server
  ///[urlPath] -> url path for request
  ///
  ///[method] -> method for request. Default is [Method.get]
  ///Method can be:
  ///Method.get -> GET
  ///Method.post -> POST
  ///Method.put -> PUT
  ///Method.delete -> DELETE
  ///
  ///[queryParameters] -> query parameters for request. Query parameters use for GET method
  ///
  /// [body] -> body for request. Body use for POST, PUT method
  ///
  /// [headers] -> headers for request. Default is null.
  Future<Response?> sendRequest({
    required String urlPath,
    Method method = Method.get,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    String? contentType,
  }) async {
    Map<String, dynamic> header = headers ?? {};
    header['accept'] = '*/*';

    ///Get token from local storage and add it to header
    String? token = await MyStorage.instance.getData('token');
    if ((token ?? '').isNotEmpty) {
      header['Authorization'] = '$token';
    }

    ///Create options for request
    var options = Options(
      headers: header,
      contentType: contentType,
      method: method.name.toUpperCase(),
    );

    dynamic response;
    try {
      ///Send request and return response
      response = await _dio.request(
        _formatUrl(urlPath),
        queryParameters: queryParameters,
        data: body,
        options: options,
      );
    } catch (e) {
      if (e is DioException) {
        return e.response;
      }

      return null;
    }

    return response;
  }

  Future<Response?> sendRequestFormData({
    required String urlPath,
    Method method = Method.get,
    Map<String, dynamic>? queryParameters,
    FormData? data,
    Map<String, dynamic>? headers,
    String? contentType,
  }) async {
    Map<String, dynamic> header = headers ?? {};
    header['accept'] = '*/*';

    ///Get token from local storage and add it to header
    String? token = await MyStorage.instance.getData('token');
    if ((token ?? '').isNotEmpty) {
      header['Authorization'] = '$token';
    }

    ///Create options for request
    var options = Options(
      headers: header,
      contentType: contentType,
      method: method.name.toUpperCase(),
    );

    dynamic response;
    try {
      ///Send request and return response
      response = await _dio.request(
        _formatUrl(urlPath),
        queryParameters: queryParameters,
        data: data,
        options: options,
      );
    } catch (e) {
      if (e is DioException) {
        return e.response;
      }

      return null;
    }

    return response;
  }

  Future<(bool, dynamic)> sendHttpRequest({
    required String urlPath,
    Method method = Method.get,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    String? contentType,
  }) async {
    // ignore: deprecated_member_use_from_same_package
    Response? response = await sendRequest(
        urlPath: urlPath,
        method: method,
        queryParameters: queryParameters,
        body: body,
        headers: headers,
        contentType: contentType);

    debugPrint(response?.statusCode.toString());
    debugPrint(response?.data.toString());
    int httpStatus = response?.statusCode ?? 0;
    bool isHttpStatusOk =
        response != null && (httpStatus >= 200 && httpStatus < 300);
    bool isServiceStatusOk = false;
    try {
      int serviceStatus =
          int.tryParse('${response?.data['statusCode']}') ?? 200;
      isServiceStatusOk = serviceStatus >= 200 && serviceStatus < 300;
    } catch (e) {
      isServiceStatusOk = false;
    }

    bool isSuccess = isHttpStatusOk && isServiceStatusOk;

    // return response?.data;
    return (isSuccess, response?.data);
  }

  Future<(bool, dynamic)> sendHttpRequestFormData({
    required String urlPath,
    Method method = Method.get,
    Map<String, dynamic>? queryParameters,
    FormData? data,
    Map<String, dynamic>? headers,
    String? contentType,
  }) async {
    // ignore: deprecated_member_use_from_same_package
    Response? response = await sendRequestFormData(
        urlPath: urlPath,
        method: method,
        queryParameters: queryParameters,
        data: data,
        headers: headers,
        contentType: contentType);

    debugPrint(response?.statusCode.toString());
    debugPrint(response?.data.toString());
    int httpStatus = response?.statusCode ?? 0;
    bool isHttpStatusOk =
        response != null && (httpStatus >= 200 && httpStatus < 300);
    bool isSuccess = isHttpStatusOk;

    // return response?.data;
    return (isSuccess, response?.data);
  }

  ///Format url to remove '/' at the end of url and encode url for special characters
  String _formatUrl(String url) {
    if ((url).isEmpty) return '';
    String editedUrl =
        url.endsWith('/') ? url.substring(0, url.length - 1) : url;

    return Uri.encodeFull(editedUrl);
  }
}
