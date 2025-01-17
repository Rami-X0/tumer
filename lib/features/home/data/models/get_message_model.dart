import 'package:json_annotation/json_annotation.dart';

part 'get_message_model.g.dart';

@JsonSerializable()
class GetAllMessagesModel {
  @JsonKey(name: r"$values")
  final List<GetMessageModel> messages;

  GetAllMessagesModel({

    required this.messages,
  });

  factory GetAllMessagesModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllMessagesModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllMessagesModelToJson(this);
}

@JsonSerializable()
class GetMessageModel {
  final String senderId;
  final String receiverId;
  final String message;
  final String? imageUrl;
  final String timestamp;

  GetMessageModel({
    required this.senderId,
    required this.receiverId,
    required this.message,
     this.imageUrl,
    required this.timestamp,
  });

  factory GetMessageModel.fromJson(Map<String, dynamic> json) =>
      _$GetMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetMessageModelToJson(this);
}
