import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tumer_detection/core/di/dependency_injection.dart';
import 'package:tumer_detection/core/helper/spacing.dart';
import 'package:tumer_detection/core/widgets/app_scaffold.dart';
import 'package:tumer_detection/features/login/cubit/login_cubit.dart';
import 'package:tumer_detection/features/login/ui/widgets/bloc_listener_login_account.dart';
import 'package:tumer_detection/features/login/ui/widgets/custom_top_animation_login.dart';
import 'package:tumer_detection/features/login/ui/widgets/dont_have_account.dart';
import 'package:tumer_detection/features/login/ui/widgets/form_login.dart';
import 'package:tumer_detection/features/login/ui/widgets/login_button.dart';
import 'package:tumer_detection/features/login/ui/widgets/text_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: AppScaffold(
        body: ListView(
          children: [
            const CustomTopAnimationLogin(),
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextLogin(),
                  verticalSpace(65.h),
                  const FormLogin(),
                  verticalSpace(45.h),
                  const LoginButton(),
                  verticalSpace(25.h),
                  const DontHaveAccount(),
                  const BlocListenerLogin(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
