part of 'chat_bloc_bloc.dart';

@immutable
sealed class ChatBlocEvent {}

class AiChatGenerateNewTextMessageEvent extends ChatBlocEvent {
  final String inputMessage;
  AiChatGenerateNewTextMessageEvent({
    required this.inputMessage,
  });
}
