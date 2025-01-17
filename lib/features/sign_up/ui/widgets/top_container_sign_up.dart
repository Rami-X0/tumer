import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tumer_detection/core/theming/app_colors.dart';

class TopContainerSignUp extends StatefulWidget {
  const TopContainerSignUp({super.key});

  @override
  State<TopContainerSignUp> createState() => _TopContainerSignUpState();
}
final tween = Tween<double>(begin: 0, end: 300);

class _TopContainerSignUpState extends State<TopContainerSignUp> {

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: tween,
      duration: const Duration(milliseconds: 1000),
      builder: (context, value, child) {
        return ClipPath(
          clipper: CustomClipperTopContainer(value),
          child: child,
        );
      },
      child: Container(
        color: AppColors.blackColor,
        width: 200.w,
        height: 180.h,
      ),
    );
  }
}

class CustomClipperTopContainer extends CustomClipper<Path> {
  double value;

  CustomClipperTopContainer(this.value);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(value, 150,value, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
