import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String id;
  final String token;
  final String email;
  final String username;
  final String role;

  LoginResponse({
    required this.id,
    required this.token,
    required this.email,
    required this.username,
    required this.role,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
