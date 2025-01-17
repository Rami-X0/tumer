import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tumer_detection/core/caching/app_shared_pref_key.dart';
import 'package:tumer_detection/features/home/cubit/home_state.dart';
import 'package:tumer_detection/features/home/cubit_patient/patient_state.dart';
import 'package:tumer_detection/features/home/data/models/send_message_model.dart';
import 'package:tumer_detection/features/home/data/repo/home_repo.dart';

class PatientCubit extends Cubit<PatientP> {
  final HomeRepo homeRepo;
  String? receiverId;

  static final TextEditingController messageControllerText =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  PatientCubit(this.homeRepo) : super(PatientInitial());

  void emitReceiverId(String receiverId) {
    this.receiverId = receiverId;
    emit(ReceiverIdP(receiverId: receiverId));
  }

  void getAllDoctors() async {
    emit(GetAllDoctorsLoadingP());
    final response = await homeRepo.getAllDoctors();
    response.when(success: (success) {
      emit(GetAllDoctorsSuccessP(success));
    }, failure: (failure) {
      emit(GetAllDoctorsFailureP(failure));
    });
  }

  void getAllPatients() async {
    emit(GetAllPatientsLoadingP());
    final response = await homeRepo.getAllPatients();
    response.when(success: (success) {
      emit(GetAllPatientsSuccessP(success));
    }, failure: (failure) {
      emit(GetAllPatientsFailureP(failure));
    });
  }

  void getAllMessages(String receiverId) async {
    print('userId: $userId');
    print('receiverId: $receiverId');
    emit(GetAllMessagesLoadingP());
    final response = await homeRepo.getAllMessages(
      senderId: userId.toString(),
      receiverId: receiverId,
    );
    response.when(success: (success) {
      emit(GetAllMessagesSuccessP(success));
    }, failure: (failure) {
      emit(GetAllMessagesFailureP(failure));
    });
  }
  void sendMessages(String receiverId) async {
    emit(SendMessagesLoadingP());
    final response = await homeRepo.sendMessages(
        sendMessageModel: SendMessageModel(
      receiverId: receiverId,
      senderId: userId,
      message: messageControllerText.text,
      timestamp: DateTime.now().toIso8601String(),
      imageUrl: 'image',
    ));
    response.when(success: (success) {
      getAllMessages(receiverId);
      messageControllerText.clear();
      emit(SendMessagesSuccessP());
    }, failure: (failure) {
      emit(SendMessagesFailureP(failure));
    });
  }

  Future<void> sendImageChat(File image, String receiverId) async {
    final form = FormData.fromMap({
      'SenderId': userId,
      'ReceiverId': receiverId,
      'Timestamp': DateTime.now().toIso8601String().toString(),
      'Message': 'message',
      'ImageUrl': await MultipartFile.fromFile(image.path),
    });

    emit(SendImageChatLoadingP());
    final response = await homeRepo.sendImageChat(form: form);
    response.when(success: (success) {
      getAllMessages(receiverId);
      emit(SendImageChatSuccessP());
    }, failure: (failure) {
      emit(SendImageChatFailureP(failure));
    });
  }
}
