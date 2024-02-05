import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wemace/features/auth/controller/auth_controller.dart';
import 'package:wemace/features/home/delegate/search_community_delegate.dart';
import 'package:wemace/features/home/drawers/community_list_drawer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void displayDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: false,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: CircleAvatar(
              backgroundImage: NetworkImage(user.profilePic),
              radius: 15,
            ),
            onPressed: () => displayDrawer(context),
          );
        }),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                    context: context, delegate: SearchCommunityDelegate(ref));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.deepPurple,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chat_outlined,
                color: Colors.deepPurple,
              )),
        ],
      ),
      drawer: CommunityListDrawer(),
    );
  }
}
