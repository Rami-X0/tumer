import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tumer_detection/core/theming/app_colors.dart';

class CustomTopAnimationLogin extends StatefulWidget {
  const CustomTopAnimationLogin({super.key});

  @override
  State<CustomTopAnimationLogin> createState() =>
      _CustomTopAnimationLoginState();
}

class _CustomTopAnimationLoginState extends State<CustomTopAnimationLogin> {
  final firstContainerTween = Tween<double>(begin: 100, end: 280);
  final secondContainerTween = Tween<double>(begin: 0, end: 400);
  final thirdContainerTween = Tween<double>(begin: 0, end: 200);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        fit: StackFit.expand,
        children: [
          TweenAnimationBuilder(
            tween: firstContainerTween,
            duration: const Duration(milliseconds: 1000),
            child: Container(
              width: 210.w,
              height: 300.h,
              color: AppColors.defaultColor,
            ),
            builder: (context, value, child) {
              return ClipPath(
                clipper: CustomClipperFirstContainer(value),
                child: child,
              );
            },
          ),
          TweenAnimationBuilder(
            tween: secondContainerTween,
            duration: const Duration(milliseconds: 1000),
            builder: (context, value, child) {
              return ClipPath(
                  clipper: CustomClipperSecondContainer(value), child: child);
            },
            child: Container(
              width: 200.w,
              height: 400.h,
              color: AppColors.blackColor,
            ),
          ),
          TweenAnimationBuilder(
            tween: thirdContainerTween,
            duration: const Duration(milliseconds: 1000),
            builder: (context, value, child) {
              return ClipPath(
                clipper: CustomClipperThirdContainer(value),
                child: child,
              );
            },
            child: Container(
              width: 200.w,
              height: 200.h,
              color: AppColors.defaultColor.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomClipperFirstContainer extends CustomClipper<Path> {
  double value;

  CustomClipperFirstContainer(this.value);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addOval(
        Rect.fromCircle(center: Offset(size.width / 1, 5), radius: value));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class CustomClipperSecondContainer extends CustomClipper<Path> {
  double value;

  CustomClipperSecondContainer(this.value);

  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(440, 180, value, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class CustomClipperThirdContainer extends CustomClipper<Path> {
  double value;

  CustomClipperThirdContainer(this.value);

  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 180 );
    path.quadraticBezierTo(value, value, value, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
