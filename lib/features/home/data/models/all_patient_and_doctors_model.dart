import 'package:json_annotation/json_annotation.dart';

part 'all_patient_and_doctors_model.g.dart';

@JsonSerializable()
class AllPatientAndDoctorsModel {
  @JsonKey(name:r'$values')
 final List<Values> values;

  AllPatientAndDoctorsModel({
    required this.values,
  });

  factory AllPatientAndDoctorsModel.fromJson(Map<String, dynamic> json) =>
      _$AllPatientAndDoctorsModelFromJson(json);
}

@JsonSerializable()
class Values {
  final String id;
  final String name;
  final String email;
  final String profileImageUrl;
  final String role;

  Values({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImageUrl,
    required this.role,
  });

  factory Values.fromJson(Map<String, dynamic> json) => _$ValuesFromJson(json);
}
