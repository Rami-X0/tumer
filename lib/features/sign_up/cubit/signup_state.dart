import 'package:tumer_detection/core/networking/api_error_model.dart';

sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoadingState extends SignUpState {}

final class SignUpSuccessState extends SignUpState {}

final class SignUpFailureState extends SignUpState {
  final ApiErrorModel failure;

  SignUpFailureState({required this.failure});
}
