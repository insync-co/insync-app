import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, {this.statusCode});

  static ApiException fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiException("Connection timeout. Please try again.");
      case DioExceptionType.sendTimeout:
        return ApiException("Send timeout. Please try again.");
      case DioExceptionType.receiveTimeout:
        return ApiException("Receive timeout. Please try again.");
      case DioExceptionType.badResponse:
        return ApiException(
          "Server error: ${error.response?.statusCode ?? 'Unknown'}",
          statusCode: error.response?.statusCode,
        );
      case DioExceptionType.cancel:
        return ApiException("Request canceled.");
      default:
        return ApiException("Unexpected error occurred.");
    }
  }

  static ApiException handleError(dynamic error) {
    if (error is DioException) {
      return fromDioError(error);
    } else {
      return ApiException("Something went wrong.");
    }
  }

  @override
  String toString() {
    return message;
  }
}
