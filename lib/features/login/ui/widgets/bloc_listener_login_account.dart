import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tumer_detection/core/helper/spacing.dart';
import 'package:tumer_detection/core/theming/app_colors.dart';
import 'package:tumer_detection/core/widgets/app_dialog.dart';
import 'package:tumer_detection/core/widgets/app_elevated_button.dart';
import 'package:tumer_detection/features/home/ui/doctors/doctors_screen.dart';
import 'package:tumer_detection/features/login/cubit/login_cubit.dart';
import 'package:tumer_detection/features/login/cubit/login_state.dart';

class BlocListenerLogin extends StatefulWidget {
  const BlocListenerLogin({super.key});

  @override
  State<BlocListenerLogin> createState() => _BlocListenerLoginState();
}

class _BlocListenerLoginState extends State<BlocListenerLogin> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          showDialog(
            barrierDismissible: false,
            context: context,
            useRootNavigator: false,
            builder: (context) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: AppDialog(
                    height: 100.h,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.defaultColor,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is LoginSuccessState) {
          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (_) => const DoctorsScreen()),(route)=>false);
          LoginCubit.emailController.clear();
          LoginCubit.passwordController.clear();
        } else if (state is LoginFailureState) {
          Navigator.pop(context);
          showDialog(
            barrierDismissible: false,
            context: context,
            useRootNavigator: false,
            builder: (context) {
              return AppDialog(
                padding: 0,
                child: _errorDialog(state.failure.getAllMessages(), context),
              );
            },
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  Widget _errorDialog(String message, BuildContext context) {
    return Column(
      spacing: 10.h,
      mainAxisSize: MainAxisSize.min,
      children: [
        verticalSpace(10),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
          ),
          child: Text(
            message,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: AppColors.defaultColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ).copyWith(fontSize: 14.sp),
          ),
        ),
        AppElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          text: 'okay',
          backgroundColor: AppColors.defaultColor,
          width: 300,
        ),
        verticalSpace(10),
      ],
    );
  }
}
