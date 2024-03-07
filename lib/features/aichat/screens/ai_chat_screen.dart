import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:wemace/features/aichat/screens/tabs/lakshmi_tab.dart';
import 'package:wemace/features/aichat/screens/tabs/saraswati_tab.dart';

class AiChatScreen extends ConsumerWidget {
  const AiChatScreen({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final currentTheme = ref.watch(themeNotifierProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
          ),
          body: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(
                    text: 'Saraswati',
                  ),
                  Tab(
                    text: 'Lakshmi',
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    SaraswatiTab(),
                    LakshmiTab(),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
