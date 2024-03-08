import 'dart:convert';

class AiChatMessageModel {
  final String role;
  final List<AiChatPartModel> parts;
  AiChatMessageModel({
    required this.role,
    required this.parts,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'role': role});
    result.addAll({'parts': parts.map((x) => x.toMap()).toList()});

    return result;
  }

  factory AiChatMessageModel.fromMap(Map<String, dynamic> map) {
    return AiChatMessageModel(
      role: map['role'] ?? '',
      parts: List<AiChatPartModel>.from(
          map['parts']?.map((x) => AiChatPartModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory AiChatMessageModel.fromJson(String source) =>
      AiChatMessageModel.fromMap(json.decode(source));
}

class AiChatPartModel {
  final String text;
  AiChatPartModel({
    required this.text,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'text': text});

    return result;
  }

  factory AiChatPartModel.fromMap(Map<String, dynamic> map) {
    return AiChatPartModel(
      text: map['text'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AiChatPartModel.fromJson(String source) =>
      AiChatPartModel.fromMap(json.decode(source));
}
