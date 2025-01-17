import 'package:tumer_detection/core/networking/api_error_model.dart';
import 'package:tumer_detection/features/home/data/models/all_patient_and_doctors_model.dart';
import 'package:tumer_detection/features/home/data/models/get_message_model.dart';
import 'package:tumer_detection/features/home/ui/doctors/get_all_message_doctors_screen.dart';

sealed class PatientP {}

final class PatientInitial extends PatientP {}

final class GetAllDoctorsLoadingP extends PatientP {}

final class GetAllDoctorsSuccessP extends PatientP {
  final AllPatientAndDoctorsModel doctors;

  GetAllDoctorsSuccessP(this.doctors);
}

final class GetAllDoctorsFailureP extends PatientP {
  final ApiErrorModel failure;

  GetAllDoctorsFailureP(this.failure);
}

final class GetAllPatientsLoadingP extends PatientP {}

final class GetAllPatientsSuccessP extends PatientP {
  final AllPatientAndDoctorsModel patients;

  GetAllPatientsSuccessP(this.patients);
}

final class GetAllPatientsFailureP extends PatientP {
  final ApiErrorModel failure;

  GetAllPatientsFailureP(this.failure);
}

final class GetAllMessagesLoadingP extends PatientP {}

final class GetAllMessagesSuccessP extends PatientP {
  final GetAllMessagesModel messages;

  GetAllMessagesSuccessP(this.messages);
}

final class GetAllMessagesFailureP extends PatientP {
  final ApiErrorModel failure;

  GetAllMessagesFailureP(this.failure);
}

final class SendMessagesLoadingP extends PatientP {}

final class SendMessagesSuccessP extends PatientP {}

final class SendMessagesFailureP extends PatientP {
  final ApiErrorModel failure;

  SendMessagesFailureP(this.failure);
}

final class SendImageChatLoadingP extends PatientP {}

final class SendImageChatSuccessP extends PatientP {}

final class SendImageChatFailureP extends PatientP {
  final ApiErrorModel failure;

  SendImageChatFailureP(this.failure);
}
class ReceiverIdP extends PatientP {
  final String receiverId;

  ReceiverIdP({required this.receiverId});
}
