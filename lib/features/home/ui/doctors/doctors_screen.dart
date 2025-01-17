import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tumer_detection/core/caching/app_shared_pref_key.dart';
import 'package:tumer_detection/core/di/dependency_injection.dart';
import 'package:tumer_detection/core/helper/spacing.dart';
import 'package:tumer_detection/core/theming/app_colors.dart';
import 'package:tumer_detection/core/widgets/app_scaffold.dart';
import 'package:tumer_detection/features/home/cubit/home_cubit.dart';
import 'package:tumer_detection/features/home/cubit_patient/patient_cubit.dart';
import 'package:tumer_detection/features/home/ui/profile_screen.dart';
import 'package:tumer_detection/features/home/ui/widgets/home_brain_tumor_slider.dart';
import 'package:tumer_detection/features/home/ui/doctors/grid_patient.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DoctorsCubit>()..getAllPatients(),
      child: AppScaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shadowColor: Colors.black,
          elevation: 10,
          title: Text(
            'Tumer Detection',
            style: TextStyle(
                color: AppColors.defaultColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ProfileScreen()));
                },
                child: CircleAvatar(
                  maxRadius: 20.w,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.r),
                      child: Image.asset('assets/images/profile.png')),
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 5.h),
          child: SafeArea(
            minimum: EdgeInsets.only(top: 10.h),
            child: ListView(
              children: [
                const PatientBrainTumorSlider(),
                const Divider(),
                verticalSpace(10.h),
                const GridPatient(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
