part of 'chat_bloc_bloc.dart';

@immutable
sealed class ChatBlocState {}

final class ChatBlocInitial extends ChatBlocState {}

class AichatSuccessState extends ChatBlocState {
  final List<AiChatMessageModel> messages;
  AichatSuccessState({
    required this.messages,
  });
}
