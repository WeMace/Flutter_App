import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:wemace/core/common/error_text.dart';
import 'package:wemace/core/common/loader.dart';
import 'package:wemace/core/constants/constants.dart';
import 'package:wemace/features/auth/controller/auth_controller.dart';
import 'package:wemace/features/community/controller/community_controller.dart';
import 'package:wemace/models/community_model.dart';
import 'package:wemace/theme/pallete.dart';

class CommunityListDrawer extends ConsumerWidget {
  const CommunityListDrawer({Key? key});

  void navigateToNavigateCommunity(BuildContext context) {
    Routemaster.of(context).push('/navigate-community');
  }

  void closeDrawer(BuildContext context) {
    Routemaster.of(context).pop();
  }

  void navigateToUserProfile(BuildContext context, String uid) {
    Routemaster.of(context).push('/u/$uid');
  }

  void logOut(WidgetRef ref) {
    ref.read(authControllerProvider.notifier).logOut();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    final isGuest = !user.isAuthenticated;
    // final currentTheme = ref.watch(themeNotifierProvider);
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 32),
              onTap: () {
                closeDrawer(context);
              },
              leading: Icon(
                Icons.close,
                size: 32,
              ),
            ),
            const Spacer(),
            ListTile(
              contentPadding: const EdgeInsets.all(12),
              onTap: () => navigateToUserProfile(context, user.uid),
              leading: Icon(
                Icons.person,
                size: 32,
              ),
              title: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(12),
              onTap: () => navigateToNavigateCommunity(context),
              leading: Icon(
                Icons.groups,
                size: 32,
              ),
              title: Text(
                'Community',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: Icon(
                Icons.travel_explore,
                size: 32,
              ),
              title: Text(
                'Explore',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: Icon(
                Icons.work,
                size: 32,
              ),
              title: Text(
                'Work',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: Icon(
                Icons.settings,
                size: 32,
              ),
              title: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            ListTile(
              onTap: () => logOut(ref),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              leading: Icon(
                Icons.logout,
                size: 28,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
