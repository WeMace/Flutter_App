import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:wemace/core/constants/constants.dart';
import 'package:wemace/features/auth/controller/auth_controller.dart';
import 'package:wemace/features/home/delegate/search_community_delegate.dart';
import 'package:wemace/features/home/drawers/community_list_drawer.dart';
import 'package:wemace/features/home/drawers/exit_drawer.dart';
import 'package:wemace/theme/pallete.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _page = 0;

  void displayDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  void displayEndDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }

  void navigateToAddPostScreen(BuildContext context) {
    Routemaster.of(context).push('/add-post');
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider)!;
    final isGuest = !user.isAuthenticated;
    // final currentTheme = ref.watch(themeNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi, ' + user.name),
        centerTitle: false,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
            )
            //  CircleAvatar(
            //   backgroundImage: NetworkImage(user.profilePic),
            //   radius: 15,
            // ),
            ,
            onPressed: () => displayDrawer(context),
          );
        }),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchCommunityDelegate(ref),
              );
            },
            icon: const Icon(
              Icons.search,
              // color: Colors.deepPurple,
            ),
          ),
          if (kIsWeb)
            IconButton(
                onPressed: () {
                  navigateToAddPostScreen(context);
                },
                icon: const Icon(
                  Icons.add,
                  // color: Colors.deepPurple,
                )),
          Builder(builder: (context) {
            return IconButton(
              onPressed: () => displayEndDrawer(context),
              icon: const Icon(
                Icons.exit_to_app,
                // color: Colors.deepPurple,
              ),
            );
          }),
        ],
      ),
      body: Constants.tabWidgets[_page],
      drawer: CommunityListDrawer(),
      endDrawer: ExitDrawer(),
      bottomNavigationBar: isGuest || kIsWeb
          ? null
          : CurvedNavigationBar(
              backgroundColor: Pallete.primaryColor,
              color: Pallete.backgroundColor,
              animationDuration: Duration(milliseconds: 358),
              items: const [
                Icon(
                  Icons.home,
                  color: Pallete.primaryColor,
                  size: 32,
                ),
                Icon(
                  Icons.add,
                  color: Pallete.primaryColor,
                  size: 32,
                ),
                Icon(
                  Icons.face,
                  color: Pallete.primaryColor,
                  size: 32,
                ),
              ],
              onTap: onPageChanged,
              // currentIndex: _page,
            ),
    );
  }
}
