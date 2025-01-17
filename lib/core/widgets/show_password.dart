
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tumer_detection/core/theming/app_colors.dart';

class ShowPassword extends StatefulWidget {
  final bool isShowPassword;
  final VoidCallback onPressed;

  const ShowPassword({
    super.key,
    required this.isShowPassword,
    required this.onPressed,
  });

  @override
  State<ShowPassword> createState() => _ShowPasswordState();
}

class _ShowPasswordState extends State<ShowPassword> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: FaIcon(
          widget.isShowPassword
              ? FontAwesomeIcons.solidEyeSlash
              : FontAwesomeIcons.solidEye,
          key: ValueKey<bool>(widget.isShowPassword),
          size: 25,
          color: AppColors.defaultColor,
        ),
      ),
    );
  }
}
