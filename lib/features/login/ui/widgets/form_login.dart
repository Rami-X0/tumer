import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tumer_detection/core/helper/spacing.dart';
import 'package:tumer_detection/core/theming/app_colors.dart';
import 'package:tumer_detection/core/widgets/app_slide_fade_animation.dart';
import 'package:tumer_detection/core/widgets/app_text_form_field.dart';
import 'package:tumer_detection/core/widgets/show_password.dart';
import 'package:tumer_detection/features/login/cubit/login_cubit.dart';


class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}


bool isShowPassword = true;

class _FormLoginState extends State<FormLogin> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().loginFormKey,
      child: Column(
        children: [
          AppSlideFadeAnimation(
            begin: 1,
            child: AppTextFormField(
              hintText: 'email',
              suffixIcon:  FaIcon(
                FontAwesomeIcons.solidEnvelope,
                size: 25.w,
                color: AppColors.defaultColor,
              ),
              validator: (value) {
                return validateEmail(value);
              },
              controller: LoginCubit.emailController,
            ),
          ),
          verticalSpace(35.h),
          AppSlideFadeAnimation(
            begin: -1,
            child: AppTextFormField(
              hintText: 'password',
              suffixIcon: ShowPassword(
                isShowPassword: isShowPassword,
                onPressed: () {
                  setState(() {
                    isShowPassword = !isShowPassword;
                  });
                },
              ),
              validator: (value) {
                return validatePassword(value);
              },
              controller: LoginCubit.passwordController,
              obscureText: isShowPassword,
            ),
          )
        ],
      ),
    );
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter your email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter your password';
    }
    return null;
  }
}
