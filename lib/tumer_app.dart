import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tumer_detection/core/caching/app_shared_pref_key.dart';
import 'package:tumer_detection/features/home/ui/doctors/doctors_screen.dart';
import 'package:tumer_detection/features/login/ui/login_screen.dart';
import 'package:tumer_detection/features/splash/splash_screen.dart';

class TumerApp extends StatelessWidget {
  const TumerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:SplashScreen(),
        // home: LoginScreen(),
      ),
    );
  }
}
