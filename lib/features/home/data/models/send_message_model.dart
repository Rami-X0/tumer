import 'package:json_annotation/json_annotation.dart';

part 'send_message_model.g.dart';

@JsonSerializable()
class SendMessageModel {
  final String senderId;
  final String receiverId;
  final String? message;
  final String? imageUrl;
  final String timestamp;

  SendMessageModel({
    required this.senderId,
    required this.receiverId,
    this.message,
    this.imageUrl,
    required this.timestamp,
  });
Map<String, dynamic> toJson() => _$SendMessageModelToJson(this);
}
