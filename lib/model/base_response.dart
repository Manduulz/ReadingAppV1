import 'dart:io';

import 'package:dio/dio.dart';

abstract class BaseResponse<T> {
  const BaseResponse();
}

class SuccessResponse<T> implements BaseResponse<T> {
  final T value;
  const SuccessResponse(this.value);
}

class ErrorResponse implements BaseResponse<Never> {
  final int? statusCode;
  final String? message;
  final bool connected;

  const ErrorResponse({
    this.statusCode,
    this.message,
    this.connected = true,
  });
  factory ErrorResponse.fromDioError(DioException error) {
    final response = error.response;
    final data = response?.data;
    if (data is String) {
      return ErrorResponse(
          statusCode: response!.statusCode!,
          message: data.split('\n').first.split("Exception:").last);
    }
    if (data != null && data.isNotEmpty && data['error_description'] != null) {
      return ErrorResponse(
        statusCode: response!.statusCode!,
      );
    }
    if (error.type == DioExceptionType.connectionTimeout ||
        error.error is SocketException) {
      return const ErrorResponse(
          message: "Failed to connect to remote server", connected: false);
    }
    return const ErrorResponse(
        message: 'Looks like something has gone wrong! Please try again.');
  }
}
