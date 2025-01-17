// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_image_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendImageChatModel _$SendImageChatModelFromJson(Map<String, dynamic> json) =>
    SendImageChatModel(
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      timestamp: json['timestamp'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$SendImageChatModelToJson(SendImageChatModel instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'timestamp': instance.timestamp,
      'imageUrl': instance.imageUrl,
    };
