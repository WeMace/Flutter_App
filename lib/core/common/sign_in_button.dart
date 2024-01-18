import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wemace/core/constants/constants.dart';
import 'package:wemace/features/auth/controller/auth_controller.dart';
import 'package:wemace/theme/pallete.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({Key? key}) : super(key: key);

  void signInWithGoogle(WidgetRef ref) {
    ref.read(AuthControllerProvider).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton.icon(
        onPressed: () => signInWithGoogle(ref),
        icon: Image.asset(
          Constants.GoogleAuth,
          width: 32,
        ),
        label: const Text(
          'Continue with Google',
          style: TextStyle(fontSize: 24),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Pallete.whiteColor,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
