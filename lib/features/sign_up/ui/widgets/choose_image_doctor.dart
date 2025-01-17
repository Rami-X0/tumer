import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tumer_detection/core/helper/spacing.dart';
import 'package:tumer_detection/core/theming/app_colors.dart';
import 'package:tumer_detection/core/widgets/app_slide_fade_animation.dart';

class ChooseImageDoctor extends StatefulWidget {
  const ChooseImageDoctor({super.key});

  @override
  State<ChooseImageDoctor> createState() => _ChooseImageDoctorState();
}

XFile? _image;

class _ChooseImageDoctorState extends State<ChooseImageDoctor> {
  @override
  Widget build(BuildContext context) {
    return AppSlideFadeAnimation(
     begin: -1,
      child: GestureDetector(
        onTap: _addImage,
        child: Row(
          children: [
            Container(
              width: 100.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: AppColors.defaultColor,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color:AppColors.defaultColor, width: 2.w),
              ),
              child: Center(
                child: Text(
                  'Choose Image',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
            horizontalSpace(15.w),
            _image != null
                ? Row(
                    children: [
                      Image.file(
                        File(_image!.path),
                        width: 100.w,
                        height: 40.h,
                      ),
                      GestureDetector(
                       onTap: (){
                         setState(() {
                           _image=null;
                         });
                       },


                        child: CircleAvatar(
                          backgroundColor: AppColors.defaultColor,
                          child: Icon(
                            Icons.clear,
                            color: Colors.white,
                            size: 25.w,
                          ),
                        ),
                      )
                    ],
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  Future<void> _addImage() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = XFile(image.path);
      });
    }
  }
}
