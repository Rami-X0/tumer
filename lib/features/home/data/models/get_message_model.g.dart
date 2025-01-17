// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllMessagesModel _$GetAllMessagesModelFromJson(Map<String, dynamic> json) =>
    GetAllMessagesModel(
      messages: (json[r'$values'] as List<dynamic>)
          .map((e) => GetMessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllMessagesModelToJson(
        GetAllMessagesModel instance) =>
    <String, dynamic>{
      r'$values': instance.messages,
    };

GetMessageModel _$GetMessageModelFromJson(Map<String, dynamic> json) =>
    GetMessageModel(
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      message: json['message'] as String,
      imageUrl: json['imageUrl'] as String?,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$GetMessageModelToJson(GetMessageModel instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'message': instance.message,
      'imageUrl': instance.imageUrl,
      'timestamp': instance.timestamp,
    };
