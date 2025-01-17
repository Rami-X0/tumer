import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tumer_detection/core/theming/app_colors.dart';
import 'package:tumer_detection/core/widgets/app_slide_fade_animation.dart';

class TextLogin extends StatelessWidget {
  const TextLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppSlideFadeAnimation(
      begin: -1,
      child: Text(
        'Login',
        style: TextStyle(
          color: AppColors.defaultColor,
          fontSize: 45.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
