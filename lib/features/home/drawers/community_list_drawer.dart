import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:wemace/core/constants/constants.dart';
import 'package:wemace/features/auth/controller/auth_controller.dart';

class CommunityListDrawer extends ConsumerWidget {
  const CommunityListDrawer({Key? key});

  void navigateToCreateCommunity(BuildContext context) {
    Routemaster.of(context).push('/create-community');
  }

  void navigateToUserProfile(BuildContext context) {
    // Routemaster.of(context).push('/user-profile');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;

    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                user.name,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              accountEmail: GestureDetector(
                onTap: () => navigateToUserProfile(context),
                child: Text(
                  'View Profile',
                  style: TextStyle(color: Colors.black54),
                ),
              ), // You can add email here if needed
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(user.profilePic),
              ),
              decoration: BoxDecoration(),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(
                Icons.add_business_outlined,
                color: Colors.deepPurple,
              ),
              title: const Text('Create a Community'),
              onTap: () => navigateToCreateCommunity(context),
            ),
            const Divider(),
            const Spacer(),
            const Divider(),
            const SizedBox(height: 8),
            ListTile(
              leading: Image.asset(Constants.googleAnalytics),
              title: const Text('Google Analytics'),
              onTap: () {},
            ),
            // Settings
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.deepPurple,
              ),
              title: const Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
