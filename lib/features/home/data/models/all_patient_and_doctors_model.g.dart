// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_patient_and_doctors_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllPatientAndDoctorsModel _$AllPatientAndDoctorsModelFromJson(
        Map<String, dynamic> json) =>
    AllPatientAndDoctorsModel(
      values: (json[r'$values'] as List<dynamic>)
          .map((e) => Values.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllPatientAndDoctorsModelToJson(
        AllPatientAndDoctorsModel instance) =>
    <String, dynamic>{
      r'$values': instance.values,
    };

Values _$ValuesFromJson(Map<String, dynamic> json) => Values(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$ValuesToJson(Values instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'profileImageUrl': instance.profileImageUrl,
      'role': instance.role,
    };
