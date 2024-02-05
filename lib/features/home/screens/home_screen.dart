import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wemace/features/auth/controller/auth_controller.dart';
import 'package:wemace/features/home/delegate/search_community_delegate.dart';
import 'package:wemace/features/home/drawers/community_list_drawer.dart';
import 'package:wemace/features/home/drawers/exit_drawer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void displayDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  void displayEndDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
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
          Builder(builder: (context) {
            return IconButton(
                onPressed: () => displayEndDrawer(context),
                icon: const Icon(
                  Icons.exit_to_app,
                  color: Colors.deepPurple,
                ));
          }),
        ],
      ),
      drawer: CommunityListDrawer(),
      endDrawer: const ExitDrawer(),
    );
  }
}
