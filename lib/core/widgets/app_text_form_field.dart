import 'package:flutter/material.dart';
import 'package:tumer_detection/core/helper/spacing.dart';
import 'package:tumer_detection/core/theming/app_colors.dart';


class AppTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final double? borderRadius;
  final double? elevation;
  final Color? shadowColor;
  final bool? obscureText;
  final Function(String?) validator;
  final TextEditingController? controller;
  final Color? fillColor;
  final TextInputType? keyboardType;

  const AppTextFormField({
    super.key,
    required this.hintText,
    required this.suffixIcon,
    this.contentPadding,
    this.obscureText,
    required this.validator,
    required this.controller,
    this.fillColor,
    this.borderRadius,
    this.elevation,
    this.shadowColor,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: (value) {
        return validator(value);
      },
      style: const TextStyle(fontWeight: FontWeight.w800),
      controller: controller,
      obscureText: obscureText ?? false,
      cursorOpacityAnimates: true,
      decoration: _textFormFiledDecoration(),
    );
  }

  InputDecoration _textFormFiledDecoration() {
    return InputDecoration(
      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(
            vertical: 17,
            horizontal: 20,
          ),
      hintText: hintText,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        borderSide: const BorderSide(
          color: Colors.grey,
          width: 1.3,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        borderSide: const BorderSide(
          color: AppColors.defaultColor,
          width: 1.3,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.3,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        borderSide: const BorderSide(color: Colors.red, width: 1.3),
      ),
      suffixIcon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: suffixIcon,
      ),
      isDense: true,
      filled: true,
      fillColor: fillColor ?? Colors.white,
    );
  }
}
