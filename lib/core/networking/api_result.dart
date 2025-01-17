import 'package:tumer_detection/core/networking/api_error_model.dart';

abstract class ApiResult<T> {
  R when<R>({
    required R Function(T data) success,
    required R Function(ApiErrorModel message) failure,
  });
}

class ApiSuccess<T> extends ApiResult<T> {
  final T data;

  ApiSuccess(this.data);

  @override
  R when<R>(
      {required R Function(T data) success,
      required R Function(ApiErrorModel message) failure}) {
    return success(data);
  }
}

class ApiFailure<T> extends ApiResult<T> {
  final ApiErrorModel message;

  ApiFailure(this.message);

  @override
  R when<R>(
      {required R Function(T data) success,
      required R Function(ApiErrorModel message) failure}) {
    return failure(message);
  }
}
