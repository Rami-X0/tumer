import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tumer_detection/core/networking/api_services.dart';
import 'package:tumer_detection/core/networking/dio_factory.dart';
import 'package:tumer_detection/features/home/cubit/home_cubit.dart';
import 'package:tumer_detection/features/home/cubit_patient/patient_cubit.dart';
import 'package:tumer_detection/features/home/data/repo/home_repo.dart';
import 'package:tumer_detection/features/login/cubit/login_cubit.dart';
import 'package:tumer_detection/features/login/data/repo/login_repo.dart';
import 'package:tumer_detection/features/sign_up/cubit/signup_cubit.dart';
import 'package:tumer_detection/features/sign_up/data/repo/signup_repo.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  Dio dio = await DioFactory.getDio();
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));
  getIt.registerLazySingleton<DoctorsCubit>(() => DoctorsCubit(getIt()));
  getIt.registerLazySingleton<PatientCubit>(() => PatientCubit(getIt()));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
}
