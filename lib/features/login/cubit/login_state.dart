import 'package:tumer_detection/core/networking/api_error_model.dart';
import 'package:tumer_detection/features/login/data/models/login_response.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {

   final LoginResponse response;

  LoginSuccessState(this.response);
}

final class LoginFailureState extends LoginState {
  final ApiErrorModel failure;

  LoginFailureState({required this.failure});
}
