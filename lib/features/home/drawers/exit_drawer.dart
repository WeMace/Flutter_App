import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:wemace/core/common/sign_in_button.dart';
import 'package:wemace/core/constants/constants.dart';
import 'package:wemace/features/auth/controller/auth_controller.dart';
import 'package:wemace/theme/pallete.dart';

class ExitDrawer extends ConsumerWidget {
  const ExitDrawer({super.key});

  void logOut(WidgetRef ref) {
    ref.read(authControllerProvider.notifier).logOut();
  }

  void navigateToEditUser(BuildContext context, String uid) {
    Routemaster.of(context).push('/edit-profile/$uid');
  }

  void toggleTheme(WidgetRef ref) {
    ref.read(themeNotifierProvider.notifier).toggleTheme();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    final isGuest = !user.isAuthenticated;
    final currentTheme = ref.watch(themeNotifierProvider);
    return Drawer(
      child: SafeArea(
          child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(user.profilePic),
            radius: 64,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            user.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider(),
          isGuest
              ? SignInButton(
                  isFromLogin: false,
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () => navigateToEditUser(context, user.uid),
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                    label: const Text(
                      'Customise Account',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: currentTheme.scaffoldBackgroundColor,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: () => logOut(ref),
              icon: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              label: isGuest
                  ? const Text(
                      'Trash Guest Account',
                      style: TextStyle(fontSize: 18),
                    )
                  : const Text(
                      'Log Out Account',
                      style: TextStyle(fontSize: 18),
                    ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: currentTheme.scaffoldBackgroundColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Switch.adaptive(
            value: ref.watch(themeNotifierProvider.notifier).mode ==
                ThemeMode.dark,
            onChanged: (val) => toggleTheme(ref),
          ),
        ],
      )),
    );
  }
}
