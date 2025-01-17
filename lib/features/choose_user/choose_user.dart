import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tumer_detection/core/helper/spacing.dart';
import 'package:tumer_detection/core/theming/app_colors.dart';
import 'package:tumer_detection/core/widgets/app_elevated_button.dart';
import 'package:tumer_detection/core/widgets/app_scaffold.dart';
import 'package:tumer_detection/core/widgets/app_slide_fade_animation.dart';
import 'package:tumer_detection/features/login/ui/login_screen.dart';

class ChooseAccountUser extends StatefulWidget {

  const ChooseAccountUser({super.key});

  @override
  State<ChooseAccountUser> createState() => _ChooseAccountUserState();
}
 bool isDoctor = true;

class _ChooseAccountUserState extends State<ChooseAccountUser> {

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppSlideFadeAnimation(
                begin: -1,
                child: Center(
                  child: Container(
                    width: 160.w,
                    height: 170.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.defaultColor,
                        width: 3.w,
                      ),
                      color: AppColors.defaultColor,
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/app_logo.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              verticalSpace(100.h),
              AppSlideFadeAnimation(
                begin: 1,
                child: AppElevatedButton(
                  backgroundColor: AppColors.defaultColor,
                  onPressed: () {
                    onTapThenPressedDoctorAndPatient(context);
                  },
                  width: double.infinity,
                  child: Text(
                    'Doctor',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              verticalSpace(50.h),
              AppSlideFadeAnimation(
                begin: -1,
                child: AppElevatedButton(
                  backgroundColor: AppColors.defaultColor,
                  onPressed: () {
                    setState(() {
                      isDoctor=false;
                    });
                    onTapThenPressedDoctorAndPatient(context);
                  },
                  width: double.infinity,
                  child: Text(
                    'Patient',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTapThenPressedDoctorAndPatient(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
        (route) => false);
  }
}
