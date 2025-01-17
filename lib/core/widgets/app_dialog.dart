import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tumer_detection/core/theming/app_colors.dart';


class AppDialog extends StatelessWidget {
  final Widget child;
  final double? padding;
  final double? height;


  const AppDialog({
    super.key,
    required this.child,
    this.padding,
     this.height,


  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Dialog(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: padding?.w ?? 20.w),
        clipBehavior: Clip.hardEdge,
        child: Container(

            height: height?.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: child),
      ),
    );
  }
}
