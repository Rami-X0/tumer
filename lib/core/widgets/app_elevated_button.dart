import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget? child;
  final String? text;
  final double? borderRadius;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? shadowColor;
  final double? elevation;
  final OutlinedBorder? circularBorder;
  final Color? borderColor;
  final double? borderWidth;

  const AppElevatedButton({
    super.key,
    required this.onPressed,
    this.child,
    this.text,
    this.borderRadius,
    this.height,
    this.width,
    this.circularBorder,
    this.backgroundColor,
    this.shadowColor,
    this.elevation,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          circularBorder ??
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
                  side: BorderSide(
                      color: borderColor ?? Colors.transparent,
                      width: borderWidth ?? 0.0)),
        ),
        minimumSize: WidgetStateProperty.all(Size(width ?? 180, height ?? 60)),
        backgroundColor:
            WidgetStateProperty.all(backgroundColor ?? Colors.blue),
        shadowColor: WidgetStateProperty.all(shadowColor ?? Colors.black),
        elevation: WidgetStateProperty.all(elevation ?? 8),
      ),
      child: child ??
          Text(
            text!,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 25,
            ),
          ),
    );
  }
}
