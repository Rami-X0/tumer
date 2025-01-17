import 'package:dio/dio.dart';
import 'package:tumer_detection/core/networking/api_error_handller.dart';
import 'package:tumer_detection/core/networking/api_result.dart';
import 'package:tumer_detection/core/networking/api_services.dart';
import 'package:tumer_detection/features/home/data/models/all_patient_and_doctors_model.dart';
import 'package:tumer_detection/features/home/data/models/get_message_model.dart';
import 'package:tumer_detection/features/home/data/models/send_message_model.dart';
import 'package:tumer_detection/features/home/ui/doctors/get_all_message_doctors_screen.dart';

class HomeRepo {
  final ApiServices apiServices;

  HomeRepo(this.apiServices);

  Future<ApiResult<AllPatientAndDoctorsModel>> getAllDoctors() async {
    try {
      final response = await apiServices.allDoctors();
      return ApiSuccess(response);
    } catch (failure) {
      print('doctor error :${failure.toString()}');
      return ApiFailure(ApiErrorHandler.handle(failure));
    }
  }

  Future<ApiResult<AllPatientAndDoctorsModel>> getAllPatients() async {
    try {
      final response = await apiServices.allPatients();
      return ApiSuccess(response);
    } catch (failure) {
      return ApiFailure(ApiErrorHandler.handle(failure));
    }
  }

  Future<ApiResult<GetAllMessagesModel>> getAllMessages({
    required String senderId,
    required String receiverId,
  }) async {
    final response = await apiServices.getMessages(senderId, receiverId);

    try {
      return ApiSuccess(response);
    } catch (failure) {
      return ApiFailure(ApiErrorHandler.handle(failure));
    }
  }

  Future<ApiResult> sendMessages(
      {required SendMessageModel sendMessageModel}) async {

    try {
      final response = await apiServices.sendMessages(sendMessageModel);

      return ApiSuccess(response);
    } catch (failure) {
      print('sendMessage${failure.toString()}');
      return ApiFailure(ApiErrorHandler.handle(failure));
    }
  }

  Future<ApiResult> sendImageChat({required FormData form}) async {
    final response = await apiServices.sendImageChat(form);
    try {
      return ApiSuccess(response);
    } catch (failure) {
      print('sendMessage${failure.toString()}');
      return ApiFailure(ApiErrorHandler.handle(failure));
    }
  }
}
