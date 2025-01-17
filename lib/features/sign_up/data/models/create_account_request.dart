import 'package:json_annotation/json_annotation.dart';

part 'create_account_request.g.dart';

@JsonSerializable()
class CreateAccountRequest {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  final String role;

  CreateAccountRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.role,
  });

Map<String, dynamic> toJson() => _$CreateAccountRequestToJson(this);
}
