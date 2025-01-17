import 'package:tumer_detection/core/networking/api_error_model.dart';
import 'package:tumer_detection/features/home/data/models/all_patient_and_doctors_model.dart';
import 'package:tumer_detection/features/home/data/models/get_message_model.dart';
import 'package:tumer_detection/features/home/ui/doctors/get_all_message_doctors_screen.dart';

sealed class DoctorsState {}

final class HomeInitial extends DoctorsState {}

final class GetAllDoctorsLoadingState extends DoctorsState {}

final class GetAllDoctorsSuccessState extends DoctorsState {
  final AllPatientAndDoctorsModel doctors;

  GetAllDoctorsSuccessState(this.doctors);
}

final class GetAllDoctorsFailureState extends DoctorsState {
  final ApiErrorModel failure;

  GetAllDoctorsFailureState(this.failure);
}

final class GetAllPatientsLoadingState extends DoctorsState {}

final class GetAllPatientsSuccessState extends DoctorsState {
  final AllPatientAndDoctorsModel patients;

  GetAllPatientsSuccessState(this.patients);
}

final class GetAllPatientsFailureState extends DoctorsState {
  final ApiErrorModel failure;

  GetAllPatientsFailureState(this.failure);
}

final class GetAllMessagesLoadingState extends DoctorsState {}

final class GetAllMessagesSuccessState extends DoctorsState {
  final GetAllMessagesModel messages;

  GetAllMessagesSuccessState(this.messages);
}

final class GetAllMessagesFailureState extends DoctorsState {
  final ApiErrorModel failure;

  GetAllMessagesFailureState(this.failure);
}

final class SendMessagesLoadingState extends DoctorsState {}

final class SendMessagesSuccessState extends DoctorsState {}

final class SendMessagesFailureState extends DoctorsState {
  final ApiErrorModel failure;

  SendMessagesFailureState(this.failure);
}

final class SendImageChatLoadingState extends DoctorsState {}

final class SendImageChatSuccessState extends DoctorsState {}

final class SendImageChatFailureState extends DoctorsState {
  final ApiErrorModel failure;

  SendImageChatFailureState(this.failure);
}
class ReceiverId extends DoctorsState {
  final String receiverId;

  ReceiverId({required this.receiverId});
}
