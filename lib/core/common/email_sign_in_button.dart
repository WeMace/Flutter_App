import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wemace/core/constants/constants.dart';
import 'package:wemace/features/auth/controller/auth_controller.dart';
import 'package:wemace/theme/pallete.dart';

class EmailsignInButton extends ConsumerWidget {
  final bool isFromLogin;
  const EmailsignInButton({Key? key, this.isFromLogin = true})
      : super(key: key);

  // void signInWithGoogle(BuildContext context, WidgetRef ref) {
  //   ref
  //       .read(authControllerProvider.notifier)
  //       .signInWithGoogle(context, isFromLogin);
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final currentTheme = ref.watch(themeNotifierProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        onPressed: () => (),
        icon: Image.asset(
          Constants.emailAuth,
          width: 28,
        ),
        label: const Text(
          'Email',
          style: TextStyle(fontSize: 24),
        ),
        style: ElevatedButton.styleFrom(
            // backgroundColor: currentTheme.scaffoldBackgroundColor,
            minimumSize: const Size(300, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
