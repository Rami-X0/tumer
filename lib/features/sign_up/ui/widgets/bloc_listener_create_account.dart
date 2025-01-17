import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tumer_detection/core/helper/spacing.dart';
import 'package:tumer_detection/core/theming/app_colors.dart';
import 'package:tumer_detection/core/widgets/app_dialog.dart';
import 'package:tumer_detection/core/widgets/app_elevated_button.dart';
import 'package:tumer_detection/features/login/ui/login_screen.dart';
import 'package:tumer_detection/features/sign_up/cubit/signup_cubit.dart';
import 'package:tumer_detection/features/sign_up/cubit/signup_state.dart';

class BlocListenerCreateAccount extends StatefulWidget {
  const BlocListenerCreateAccount({super.key});

  @override
  State<BlocListenerCreateAccount> createState() =>
      _BlocListenerCreateAccountState();
}

class _BlocListenerCreateAccountState extends State<BlocListenerCreateAccount> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoadingState) {
          showDialog(
            barrierDismissible: false,
            context: context,
            useRootNavigator: false,
            builder: (context) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: AppDialog(
                    height: 100.h,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.defaultColor,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is SignUpSuccessState) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const LoginScreen()));
          SignUpCubit.emailController.clear();
          SignUpCubit.phoneNumberController.clear();
          SignUpCubit.passwordController.clear();
          SignUpCubit.nameController.clear();
        } else if (state is SignUpFailureState) {
          Navigator.pop(context);
          showDialog(
            barrierDismissible: false,
            context: context,
            useRootNavigator: false,
            builder: (context) {
              return AppDialog(
                padding: 0,
                child: _errorDialog(state.failure.getAllMessages(), context),
              );
            },
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  // void stateIsLoading(BuildContext context) {
  //   _isLoading.value = false;
  //   Future.delayed(Duration(milliseconds: 1000), () {
  //     _isLoading.value = true;
  //
  //     if (context.mounted) {
  //       Navigator.pop(context);
  //     }
  //   });
  // }

  Widget _errorDialog(String message, BuildContext context) {
    return Column(
      spacing: 10.h,
      mainAxisSize: MainAxisSize.min,
      children: [
        verticalSpace(10),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
          ),
          child: Text(
            message,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: AppColors.defaultColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ).copyWith(fontSize: 14.sp),
          ),
        ),
        AppElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          text: 'okay',
          backgroundColor: AppColors.defaultColor,
          width: 300,
        ),
        verticalSpace(10),
      ],
    );
  }
}
