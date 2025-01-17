import 'package:tumer_detection/core/networking/api_error_handller.dart';
import 'package:tumer_detection/core/networking/api_result.dart';
import 'package:tumer_detection/core/networking/api_services.dart';
import 'package:tumer_detection/features/sign_up/data/models/create_account_request.dart';

class SignUpRepo{
  final ApiServices apiServices;

  SignUpRepo(this.apiServices);

 Future<ApiResult> createAccount(CreateAccountRequest signUp)async{
   try{
     final response=await apiServices.signup(signUp);
   return ApiSuccess(response);
   }catch(failure){
     return ApiFailure(ApiErrorHandler.handle(failure));
   }
 }
}