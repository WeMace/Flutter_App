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

  void navigateToCreateCommunity(BuildContext context) {
    Routemaster.of(context).push('/create-community');
  }

  void navigateToUserProfile(BuildContext context, String uid) {
    Routemaster.of(context).push('/u/$uid');
  }

  void navigateToCommunity(BuildContext context, Community community) {
    Routemaster.of(context).push('/r/${community.name}');
  }

  void logOut(WidgetRef ref) {
    ref.read(authControllerProvider.notifier).logOut();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    final isGuest = !user.isAuthenticated;
    final currentTheme = ref.watch(themeNotifierProvider);
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                user.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: currentTheme.dividerColor),
              ),
              accountEmail: isGuest
                  ? GestureDetector(
                      onTap: () => logOut(ref),
                      child: Text(
                        'Sign up/Log in',
                        style: TextStyle(color: currentTheme.dividerColor),
                      ),
                    )
                  : GestureDetector(
                      onTap: () => navigateToUserProfile(context, user.uid),
                      child: Text(
                        'View Profile',
                        style: TextStyle(color: currentTheme.dividerColor),
                      ),
                    ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(user.profilePic),
              ),
              decoration: BoxDecoration(),
            ),
            isGuest
                ? const SizedBox(
                    height: 8,
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      onPressed: () => navigateToCreateCommunity(context),
                      icon: const Icon(
                        Icons.add_business_outlined,
                        color: Colors.purple,
                      ),
                      label: const Text(
                        'Create a Community',
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: currentTheme.scaffoldBackgroundColor,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
            if (!isGuest)
              ref.watch(userCommunitiesProvider).when(
                    data: (communities) => Expanded(
                      child: ListView.builder(
                        itemCount: communities.length,
                        itemBuilder: (BuildContext context, int index) {
                          final community = communities[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: currentTheme.indicatorColor,
                              backgroundImage: NetworkImage(community.avatar),
                              radius: 24,
                            ),
                            title: Text('${community.name}'),
                            onTap: () {
                              navigateToCommunity(context, community);
                            },
                          );
                        },
                      ),
                    ),
                    error: (error, stackTrace) => ErrorText(
                      error: error.toString(),
                    ),
                    loading: () => const Loader(),
                  ),
            if (isGuest) const Spacer(),
            const Divider(),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: () => {},
                icon: Image.asset(
                  Constants.googleAnalytics,
                  width: 32,
                ),
                label: const Text(
                  'Google Analytics',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: currentTheme.scaffoldBackgroundColor,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            // Settings
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: () => {},
                icon: const Icon(
                  Icons.settings,
                  color: Colors.deepPurple,
                ),
                label: const Text(
                  'Settings',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                    // alignment: Alignment.center,   //mess around for text alignment
                    backgroundColor: currentTheme.scaffoldBackgroundColor,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
