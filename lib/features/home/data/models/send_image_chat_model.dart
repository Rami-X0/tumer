import 'package:json_annotation/json_annotation.dart';

part 'send_image_chat_model.g.dart';

@JsonSerializable()
class SendImageChatModel {
  final String senderId;
  final String receiverId;
  final String timestamp;
  final String imageUrl;

  SendImageChatModel({
    required this.senderId,
    required this.receiverId,
    required this.timestamp,
    required this.imageUrl,
  });

Map<String, dynamic> toJson() => _$SendImageChatModelToJson(this);
}
