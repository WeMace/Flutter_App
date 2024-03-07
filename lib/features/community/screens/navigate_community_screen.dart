import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:wemace/features/auth/controller/auth_controller.dart';
import 'package:wemace/models/community_model.dart';
import 'package:wemace/theme/pallete.dart';

class NavigateCommunityScreen extends ConsumerWidget {
  const NavigateCommunityScreen({Key? key});

  void navigateToCommunity(BuildContext context, Community community) {
    Routemaster.of(context).push('/r/${community.name}');
  }

  void navigateToCreateCommunity(BuildContext context) {
    Routemaster.of(context).push('/create-community');
  }

  void navigateToHome(BuildContext context) {
    Routemaster.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final currentTheme = ref.watch(themeNotifierProvider);
    final cardHeightWidth = kIsWeb ? 200.0 : 150.0;
    final iconSize = kIsWeb ? 80.0 : 60.0;
    final user = ref.watch(userProvider)!;
    final isGuest = !user.isAuthenticated;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () => {},
            style: ElevatedButton.styleFrom(
              elevation: 24,
              minimumSize: Size(200, cardHeightWidth),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: Center(
              child: Text(
                'My Communities',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => {navigateToCreateCommunity(context)},
            style: ElevatedButton.styleFrom(
              elevation: 24,
              minimumSize: Size(200, cardHeightWidth),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: Center(
              child: Text(
                'Create Community',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => {},
            style: ElevatedButton.styleFrom(
              elevation: 24,
              minimumSize: Size(200, cardHeightWidth),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: Center(
              child: Text(
                'Explore\n Communities',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
