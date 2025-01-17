import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tumer_detection/features/sign_up/cubit/signup_state.dart';
import 'package:tumer_detection/features/sign_up/data/models/create_account_request.dart';
import 'package:tumer_detection/features/sign_up/data/repo/signup_repo.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo signUpRepo;

  SignUpCubit(this.signUpRepo) : super(SignUpInitial());
  static String role = 'Doctor';
  static final TextEditingController nameController = TextEditingController();
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();
  static final TextEditingController phoneNumberController =
      TextEditingController();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    emit(SignUpLoadingState());
    final response = await signUpRepo.createAccount(
      CreateAccountRequest(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        phoneNumber: phoneNumberController.text,
        role: role,
      ),
    );
    response.when(success: (success) {
      emit(SignUpSuccessState());
    }, failure: (failure) {
      emit(SignUpFailureState(failure: failure));
    });
  }
}
