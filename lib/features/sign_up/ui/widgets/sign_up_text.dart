import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tumer_detection/core/theming/app_colors.dart';
import 'package:tumer_detection/core/widgets/app_slide_fade_animation.dart';


class SignUpText extends StatelessWidget {
  const SignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppSlideFadeAnimation(
      begin: -1,
      child: Text(
        'Sign Up',
        style: TextStyle(
          color: AppColors.defaultColor,
          fontSize: 45.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
