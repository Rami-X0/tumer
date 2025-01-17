import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tumer_detection/core/caching/app_shared_pref_key.dart';
import 'package:tumer_detection/core/theming/app_colors.dart';
import 'package:tumer_detection/features/home/cubit/home_cubit.dart';
import 'package:tumer_detection/features/home/cubit/home_state.dart';
import 'package:tumer_detection/features/home/cubit_patient/patient_cubit.dart';
import 'package:tumer_detection/features/home/cubit_patient/patient_state.dart';
import 'package:tumer_detection/features/home/data/models/all_patient_and_doctors_model.dart';
import 'package:tumer_detection/features/home/ui/doctors/get_all_message_doctors_screen.dart';

class GridDoctor extends StatefulWidget {
  const GridDoctor({super.key});

  @override
  State<GridDoctor> createState() => _GridDoctorState();
}

class _GridDoctorState extends State<GridDoctor> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientCubit, PatientP>(
      buildWhen: (previous, current) =>
          current is GetAllDoctorsLoadingP || current is GetAllDoctorsSuccessP,
      builder: (context, state) {
        if (state is GetAllDoctorsLoadingP) {
          return SizedBox(
            height: 400.h,
            child: const Center(
              child: CircularProgressIndicator(
                color: AppColors.defaultColor,
              ),
            ),
          );
        } else if (state is GetAllDoctorsSuccessP) {
          return _defaultGrid(state.doctors);
        } else {
          return Center(
            child: Text(role == 'Patients' ? 'No Patients' : 'No Doctors'),
          );
        }
      },
    );
  }

  Widget _defaultGrid(AllPatientAndDoctorsModel data) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.values.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5.w,
        crossAxisSpacing: 5.h,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return Stack(
          // fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                    image: CachedNetworkImageProvider(role == 'Doctor'
                        ? 'https://img.freepik.com/free-vector/hand-drawn-chemotherapy-illustration_23-2149355428.jpg?t=st=1737031193~exp=1737034793~hmac=c5d07f77535c818b95fc7bab3ac01d822d0776b2e742e34425291d72002adcb3&w=996'
                        : _imageDoctors[0]),
                    fit: BoxFit.cover),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 25.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.blackColor.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      '${role == 'Patient' ? 'Dr: ' : 'Pa: '}${data.values[index].name}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w800),
                    ),
                    GestureDetector(
                        onTap: () {
                          // context
                          //     .read<PatientCubit>()
                          //     .emitReceiverId(data.values[index].id.toString());
//                           setState(() {});
                          print(
                              'ssssssssssssssssssss${context.read<PatientCubit>().receiverId}');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => GetAllMessageDoctorsScreen(
                                        name: data.values[index].name,
                                        receiverId:
                                            data.values[index].id.toString(),
                                      )));

// print()
                        },
                        child: FaIcon(
                          FontAwesomeIcons.solidComment,
                          color: Colors.white,
                          size: 20.w,
                        ))
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

List<String> _imageDoctors = [
  'https://img.freepik.com/premium-photo/male-female-doctor-portrait-healthcare-medical-staff-concept-confident-doctor-portrait_71956-32908.jpg?ga=GA1.1.1923401238.1728614943&semt=ais_hybrid',
  'https://img.freepik.com/premium-photo/male-female-doctor-portrait-healthcare-medical-staff-concept-confident-doctor-portrait_71956-32933.jpg?ga=GA1.1.1923401238.1728614943&semt=ais_hybrid',
];
