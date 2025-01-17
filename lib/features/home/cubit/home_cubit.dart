import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tumer_detection/core/caching/app_shared_pref_key.dart';
import 'package:tumer_detection/features/home/cubit/home_state.dart';
import 'package:tumer_detection/features/home/data/models/send_message_model.dart';
import 'package:tumer_detection/features/home/data/repo/home_repo.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  final HomeRepo homeRepo;
  String? receiverId;

  static final TextEditingController messageControllerText =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DoctorsCubit(this.homeRepo) : super(HomeInitial());

  void emitReceiverId(String receiverId) {
    this.receiverId = receiverId;
    emit(ReceiverId(receiverId: receiverId));
  }

  void getAllDoctors() async {
    emit(GetAllDoctorsLoadingState());
    final response = await homeRepo.getAllDoctors();
    response.when(success: (success) {
      emit(GetAllDoctorsSuccessState(success));
    }, failure: (failure) {
      emit(GetAllDoctorsFailureState(failure));
    });
  }

  void getAllPatients() async {
    emit(GetAllPatientsLoadingState());
    final response = await homeRepo.getAllPatients();
    response.when(success: (success) {
      emit(GetAllPatientsSuccessState(success));
    }, failure: (failure) {
      emit(GetAllPatientsFailureState(failure));
    });
  }

  void getAllMessages(String receiverId) async {
    print('userId: $userId');
    print('receiverId: $receiverId');
    emit(GetAllMessagesLoadingState());

    final response = await homeRepo.getAllMessages(
      senderId: userId.toString(),
      receiverId: receiverId,
    );

    response.when(success: (success) {
      emit(GetAllMessagesSuccessState(success));
    }, failure: (failure) {
      emit(GetAllMessagesFailureState(failure));
    });
  }

  void sendMessages(String receiverId) async {
    emit(SendMessagesLoadingState());
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
      emit(SendMessagesSuccessState());
    }, failure: (failure) {
      emit(SendMessagesFailureState(failure));
    });
  }

  Future<void> sendImageChat(File image,String receiverId) async {
    final form = FormData.fromMap({
      'SenderId': userId,
      'ReceiverId': receiverId,
      'Timestamp': DateTime.now().toIso8601String().toString(),
      'Message': 'message',
      'ImageUrl': await MultipartFile.fromFile(image.path),
    });

    emit(SendImageChatLoadingState());
    final response = await homeRepo.sendImageChat(form: form);
    response.when(success: (success) {
      getAllMessages(receiverId);
      emit(SendImageChatSuccessState());
    }, failure: (failure) {
      emit(SendImageChatFailureState(failure));
    });
  }
}
