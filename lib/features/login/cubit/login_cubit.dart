import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tumer_detection/core/caching/app_shared_pref.dart';
import 'package:tumer_detection/core/caching/app_shared_pref_key.dart';
import 'package:tumer_detection/features/login/cubit/login_state.dart';
import 'package:tumer_detection/features/login/data/models/login_request.dart';
import 'package:tumer_detection/features/login/data/repo/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  LoginCubit(this.loginRepo) : super(LoginInitial());

  Future<void> login() async {
    emit(LoginLoadingState());
    final response = await loginRepo.login(
      LoginRequest(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(success: (success) async {
      await saveRole(success.role);
      await saveUserId(success.id);
      await saveName(success.username);
      await saveEmail(success.email);
      emit(LoginSuccessState(success));
    }, failure: (failure) {
      emit(LoginFailureState(failure: failure));
    });
  }

  Future<void> saveRole(String userRole) async {
    await AppSharedPref.sharedPrefSet(
        key: AppSharedPrefKey.role, value: userRole);
    role = await AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.role);
  }

  Future<void> saveUserId(String id) async {
    await AppSharedPref.sharedPrefSet(key: AppSharedPrefKey.userId, value: id);
    userId = await AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.userId);
  }

  Future<void> saveName(String nameUser) async {
    await AppSharedPref.sharedPrefSet(key: AppSharedPrefKey.name, value: nameUser);
    name = await AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.name);
  }

  Future<void> saveEmail(String emailUser) async {
    await AppSharedPref.sharedPrefSet(
        key: AppSharedPrefKey.email, value: emailUser);
    email = await AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.email);
  }
}
