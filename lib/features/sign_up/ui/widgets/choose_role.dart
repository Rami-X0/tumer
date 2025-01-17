import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tumer_detection/core/theming/app_colors.dart';
import 'package:tumer_detection/core/widgets/app_slide_fade_animation.dart';
import 'package:tumer_detection/features/sign_up/cubit/signup_cubit.dart';

class ChooseRole extends StatefulWidget {
  const ChooseRole({super.key});

  @override
  State<ChooseRole> createState() => _ChooseRoleState();
}

class _ChooseRoleState extends State<ChooseRole> {
  @override
  Widget build(BuildContext context) {
    return  AppSlideFadeAnimation (
      begin: -1,
      child: Row(
        children: List.generate(
          2,
          (index) {
            return _defaultRadio(
              value: index == 0 ? 'Doctor' : 'Patient',
              text: index == 0 ? 'Doctor' : 'Patient',
              onChanged: (value) {
                setState(() {
                  SignUpCubit.role = value!;
                  print(SignUpCubit.role);
                });
              },
            );
          },
        ),
      ),
    );
  }

  Widget _defaultRadio({
    required String text,
    required String value,
    required Function(String?) onChanged,
  }) {
    return Row(
      children: [
        Radio(
          activeColor: AppColors.defaultColor,
          value: value,
          groupValue:  SignUpCubit.role ,
          onChanged: onChanged,
        ),
        Text(
          text,
          style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
