import 'package:dio/dio.dart';
import 'package:tumer_detection/core/networking/api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "Connection to server failed");
        case DioExceptionType.cancel:
          return ApiErrorModel(message: "Request to the server was cancelled");
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "Connection timeout with the server");
        case DioExceptionType.unknown:
          return ApiErrorModel(
              message:
              "Connection to the server failed due to internet connection");
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
              message: "Receive timeout in connection with the server");
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
              message: "Send timeout in connection with the server");
        default:
          return ApiErrorModel(message: "Something went wrong");
      }
    } else {
      return ApiErrorModel(message: "Unexpected error occurred");
    }
  }

  static ApiErrorModel _handleError(dynamic message) {
    if (message is Map<String, dynamic> && message['\$values'] != null) {
      List<dynamic> errors = message['\$values'];
      if (errors.isNotEmpty) {
        String aggregatedMessages = errors.map((error) {
          return "${error['code']}: ${error['description']}";
        }).join('\n');
        return ApiErrorModel(message: aggregatedMessages);
      }
    }

    if (message is String) {
      return ApiErrorModel(message: message);
    }

    return ApiErrorModel(message: "An unknown error occurred");
  }
}
