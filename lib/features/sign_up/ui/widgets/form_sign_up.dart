import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tumer_detection/core/helper/spacing.dart';
import 'package:tumer_detection/core/theming/app_colors.dart';
import 'package:tumer_detection/core/widgets/app_slide_fade_animation.dart';
import 'package:tumer_detection/core/widgets/app_text_form_field.dart';
import 'package:tumer_detection/core/widgets/show_password.dart';
import 'package:tumer_detection/features/sign_up/cubit/signup_cubit.dart';

class FormSignUp extends StatefulWidget {
  const FormSignUp({super.key});

  @override
  State<FormSignUp> createState() => _FormSignUpState();
}

bool isShowPassword = true;
bool isConfirmShowPassword = true;

class _FormSignUpState extends State<FormSignUp> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().signUpFormKey,
      child: Column(
        children: [
          AppSlideFadeAnimation(
            begin: -1,
            child: AppTextFormField(
              hintText: 'name',
              suffixIcon: FaIcon(
                FontAwesomeIcons.solidUser,
                size: 25.sp,
                color: AppColors.defaultColor,
              ),
              validator: (value) {
                return validateName(value);
              },
              controller: SignUpCubit.nameController,
            ),
          ),
          verticalSpace(35.h),
          AppSlideFadeAnimation(
            begin: 1,
            child: AppTextFormField(
              hintText: 'email',
              suffixIcon: FaIcon(
                FontAwesomeIcons.solidEnvelope,
                size: 25.sp,
                color: AppColors.defaultColor,
              ),
              validator: (value) {
                return validateEmail(value);
              },
              controller: SignUpCubit.emailController,
            ),
          ),
          verticalSpace(35.h),
          AppSlideFadeAnimation(
            begin: -1,
            child: AppTextFormField(
              hintText: 'phone Number',
              suffixIcon: FaIcon(
                FontAwesomeIcons.phone,
                size: 25.sp,
                color: AppColors.defaultColor,
              ),
              validator: (value) {
                return validatePhoneNumber(value);
              },
              controller: SignUpCubit.phoneNumberController,

            ),
          ),
          verticalSpace(35.h),
          AppSlideFadeAnimation(
            begin: 1,
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
              controller: SignUpCubit.passwordController,
              obscureText: isShowPassword,
            ),
          ),
        ],
      ),
    );
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter your name';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter your phoneNumber';
    }
    return null;
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
