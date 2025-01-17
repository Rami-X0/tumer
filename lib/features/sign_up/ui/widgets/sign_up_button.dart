import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tumer_detection/core/theming/app_colors.dart';
import 'package:tumer_detection/core/widgets/app_elevated_button.dart';
import 'package:tumer_detection/core/widgets/app_slide_fade_animation.dart';
import 'package:tumer_detection/features/login/ui/login_screen.dart';
import 'package:tumer_detection/features/sign_up/cubit/signup_cubit.dart';
import 'package:tumer_detection/features/sign_up/ui/widgets/form_sign_up.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSlideFadeAnimation(
      begin: 1,
      child: AppElevatedButton(
        onPressed: () {
          onTapThenPressedLogin(context);
        },
        backgroundColor: AppColors.defaultColor,
        width: double.infinity,
        child: Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  void onTapThenPressedLogin(BuildContext context) {
    if (context.read<SignUpCubit>().signUpFormKey.currentState!.validate()) {
      context.read<SignUpCubit>().signUp();
    }
  }
}
