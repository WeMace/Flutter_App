import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wemace/core/constants/constants.dart';
import 'package:wemace/features/aichat/bloc/chat_bloc_bloc.dart';
import 'package:wemace/models/ai_chat_message_model.dart';
import 'package:wemace/theme/pallete.dart';

class SaraswatiTab extends StatelessWidget {
  SaraswatiTab({Key? key});

  final ChatBlocBloc chatBlocBloc = ChatBlocBloc();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<ChatBlocBloc, ChatBlocState>(
        bloc: chatBlocBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case AichatSuccessState:
              List<AiChatMessageModel> messages =
                  (state as AichatSuccessState).messages;
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: Image.asset(
                          Constants.Saraswati,
                        ),
                      ),
                      const Text(
                        'Ask Goddess Saraswati',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        child: const Text(
                          'Powered by Gemini Pro Vision, trained on a tailored dataset, to unlock their full potential.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: List.generate(messages.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: Colors.white,
                              ),
                              child: Text(
                                messages[index].parts.first.text,
                                style: TextStyle(color: Pallete.primaryColor),
                              ),
                            ),
                          );
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  color: Pallete.surfaceColor,
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: textEditingController,
                                        style: TextStyle(
                                          color: Pallete.primaryColor,
                                        ),
                                        cursorColor: Pallete.primaryColor,
                                        // controller: ,
                                        decoration: InputDecoration(
                                          hintText: 'Share your Doubts',
                                          hintStyle: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        if (textEditingController
                                            .text.isNotEmpty) {
                                          String userInputText =
                                              textEditingController.text;
                                          textEditingController.clear();
                                          chatBlocBloc.add(
                                              AiChatGenerateNewTextMessageEvent(
                                                  inputMessage: userInputText));
                                        }
                                      },
                                      icon: Icon(Icons.send),
                                      color: Pallete.primaryColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
