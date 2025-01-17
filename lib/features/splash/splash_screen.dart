import 'package:flutter/material.dart';
import 'package:tumer_detection/core/caching/app_shared_pref_key.dart';
import 'package:tumer_detection/core/theming/app_colors.dart';
import 'package:tumer_detection/core/widgets/app_scaffold.dart';
import 'package:tumer_detection/features/choose_user/choose_user.dart';
import 'package:tumer_detection/features/home/ui/patient/patient_screen.dart';
import 'package:tumer_detection/features/login/ui/login_screen.dart';

import '../home/ui/doctors/doctors_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controllerContainer;
  late AnimationController _controllerImage;
  late Animation<double> _heightAnimation;
  late Animation<double> _fadeTransitionAnimation;

  @override
  void initState() {
    super.initState();
    _animationControllerContainer();
    _animationControllerImage();
    _colorControllerContainer();
    _heightContainerAnimation();
    _fadeImageTransition();
    _actionThenFinishAnimation();
  }

  void _actionThenFinishAnimation() {
    Future.delayed(
      const Duration(milliseconds: 2200),
      () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (_) => role == null
                  ? LoginScreen()
                  : role == 'Doctor'
                      ? DoctorsScreen()
                      : PatientScreen(),
            ),
            (_) => false);
      },
    );
  }

  void _animationControllerContainer() {
    _controllerContainer = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500))
      ..forward();
  }

  void _animationControllerImage() {
    _controllerImage = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..forward();
  }

  void _colorControllerContainer() {
    _controllerContainer = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1100))
      ..forward();
  }

  void _heightContainerAnimation() {
    _heightAnimation =
        Tween<double>(begin: 500, end: 1000).animate(_controllerContainer);
  }

  void _fadeImageTransition() {
    _fadeTransitionAnimation =
        Tween<double>(begin: 0, end: 1).animate(_controllerImage);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      statusBarColor: AppColors.blackColor,
      body: Stack(
        children: [
          AnimatedBuilder(
            builder: (context, child) {
              return Container(
                width: double.infinity,
                height: _heightAnimation.value,
                color: AppColors.blackColor,
              );
            },
            animation: _controllerImage,
          ),
          FadeTransition(
            opacity: _fadeTransitionAnimation,
            child: Center(child: Image.asset('assets/images/app_logo.jpeg')),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controllerImage.dispose();
    _controllerContainer.dispose();
    super.dispose();
  }
}
