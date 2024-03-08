import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wemace/features/aichat/repository/ai_chat_repo.dart';
import 'package:wemace/models/ai_chat_message_model.dart';

part 'chat_bloc_event.dart';
part 'chat_bloc_state.dart';

class ChatBlocBloc extends Bloc<ChatBlocEvent, ChatBlocState> {
  ChatBlocBloc() : super(AichatSuccessState(messages: [])) {
    on<AiChatGenerateNewTextMessageEvent>(aiChatGenerateNewTextMessageEvent);
  }
  List<AiChatMessageModel> messages = [];

  FutureOr<void> aiChatGenerateNewTextMessageEvent(
      AiChatGenerateNewTextMessageEvent event,
      Emitter<ChatBlocState> emit) async {
    messages.add(
      AiChatMessageModel(
        role: "user",
        parts: [AiChatPartModel(text: event.inputMessage)],
      ),
    );
    emit(AichatSuccessState(messages: messages));

    await AiChatRepo.AichatTextGenerationRepo(messages);
  }
}
