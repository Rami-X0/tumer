import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tumer_detection/core/caching/app_shared_pref.dart';
import 'package:tumer_detection/core/caching/app_shared_pref_key.dart';
import 'package:tumer_detection/core/theming/app_colors.dart';
import 'package:tumer_detection/core/widgets/app_scaffold.dart';
import 'package:tumer_detection/features/home/cubit/home_cubit.dart';
import 'package:tumer_detection/features/login/ui/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        elevation: 10,
        shadowColor: Colors.black,
        title: Text(
          'Profile',
          style: TextStyle(
            color: AppColors.defaultColor,
            fontSize: 30.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(vertical: 5.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            spacing: 10.h,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor:
                      AppColors.defaultColor.withValues(alpha: 0.5),
                  maxRadius: 70.w,
                  child: Padding(
                    padding: EdgeInsets.all(8.0.w),
                    child: ClipOval(
                        child: Image.asset('assets/images/profile.png')),
                  ),
                ),
              ),
              Divider(),
              _defaultText(
                  title: 'Name',
                  subTitle: name,
                  icon: FontAwesomeIcons.user,
                  context: context),
              Divider(),
              _defaultText(
                  title: 'Email',
                  subTitle: email,
                  icon: FontAwesomeIcons.envelope,
                  context: context),
              Divider(),
              InkWell(
                onTap: () {


                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>LoginScreen()),(route)=>false);
                  AppSharedPref.removeAllKey();
                },
                child: Row(
                  children: [
                    Text(
                      'LogOut'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.defaultColor.withValues(alpha: 0.5)),
                    ),
                    // context.horizontalSpace(15.w),
                    SizedBox(
                      width: 15.h,
                    ),
                    FaIcon(
                      FontAwesomeIcons.arrowRightFromBracket,
                      color: AppColors.defaultColor,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _defaultText({
    required String title,
    required String subTitle,
    required IconData icon,
    required BuildContext context,
  }) {
    return Row(children: [
      Text(
        '$title :',
        style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.defaultColor.withValues(alpha: 0.5)),
      ),
      Text(
        subTitle,
        style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.defaultColor.withValues(alpha: 0.5)),
      ),
      SizedBox(
        width: 55.h,
      ),
      FaIcon(
        icon,
        color: AppColors.defaultColor,
      )
    ]);
  }
}
