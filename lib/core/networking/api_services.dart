import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';
import 'package:tumer_detection/core/networking/api_constatnts.dart';
import 'package:tumer_detection/features/home/data/models/all_patient_and_doctors_model.dart';
import 'package:tumer_detection/features/home/data/models/get_message_model.dart';
import 'package:tumer_detection/features/home/data/models/send_image_chat_model.dart';
import 'package:tumer_detection/features/home/data/models/send_message_model.dart';
import 'package:tumer_detection/features/login/data/models/login_request.dart';
import 'package:tumer_detection/features/login/data/models/login_response.dart';
import 'package:tumer_detection/features/sign_up/data/models/create_account_request.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST(ApiConstants.signUp)
  Future signup(@Body() CreateAccountRequest createAccountRequest);

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @GET(ApiConstants.allDoctors)
  Future<AllPatientAndDoctorsModel> allDoctors();

  @GET(ApiConstants.allPatients)
  Future<AllPatientAndDoctorsModel> allPatients();
  @POST(ApiConstants.sendMessages)
  Future sendMessages(@Body() SendMessageModel sendMessageModel);
  @GET('${ApiConstants.getMessages}/{senderid}/{receiverid}')
  Future<GetAllMessagesModel> getMessages( @Path('senderid') String senderId, @Path('receiverid') String receiverId);
  @POST(ApiConstants.imageChat)
  Future sendImageChat(@Body() FormData sendImageChatModel);

}
