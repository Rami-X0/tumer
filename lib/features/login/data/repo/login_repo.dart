import 'package:tumer_detection/core/networking/api_error_handller.dart';
import 'package:tumer_detection/core/networking/api_result.dart';
import 'package:tumer_detection/core/networking/api_services.dart';
import 'package:tumer_detection/features/login/data/models/login_request.dart';
import 'package:tumer_detection/features/login/data/models/login_response.dart';
import 'package:tumer_detection/features/sign_up/data/models/create_account_request.dart';

class LoginRepo {
  final ApiServices apiServices;

  LoginRepo(this.apiServices);

  Future<ApiResult<LoginResponse>> login(LoginRequest login) async {
    try {
      final response = await apiServices.login(login);
      return ApiSuccess(response);
    } catch (failure) {
      return ApiFailure(ApiErrorHandler.handle(failure));
    }
  }
}
