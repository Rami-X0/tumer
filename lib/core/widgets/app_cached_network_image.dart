import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tumer_detection/core/theming/app_colors.dart';

class AppCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? circular;
  final double? widthErrorIcon;
  final double? heightErrorIcon;
  final double? widthImage;
  final double? heightImage;
  final double? topLeftBorder;
  final double? topRightBorder;
  final double? bottomLeftBorder;
  final double? bottomRightBorder;
  final BoxFit? fitImage;

  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.circular,
    this.widthErrorIcon,
    this.heightErrorIcon,
    this.widthImage,
    this.heightImage,
    this.fitImage,
    this.topLeftBorder,
    this.topRightBorder,
    this.bottomLeftBorder,
    this.bottomRightBorder,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeftBorder?.w ?? 14),
        topRight: Radius.circular(topRightBorder?.w ?? 14),
        bottomLeft: Radius.circular(bottomLeftBorder?.w ?? 14),
        bottomRight: Radius.circular(bottomRightBorder?.w ?? 14),
      ),
      child: CachedNetworkImage(
        width: widthImage?.w,
        height: heightImage?.h,
        imageUrl: imageUrl.toString(),
        placeholder: (context, url) => const CircularProgressIndicator(
          color: AppColors.defaultColor,
        ),
        errorWidget: (context, error, url) => errorDownloadImage(),
        fit: fitImage,
      ),
    );
  }

  Widget errorDownloadImage() {
    return SizedBox(
      width: widthErrorIcon ?? 255.w,
      height: heightErrorIcon ?? 225.h,
      child: const Center(
        child: FaIcon(
          FontAwesomeIcons.circleExclamation,
          color: Colors.black12,
          size: 50,
        ),
      ),
    );
  }
}
