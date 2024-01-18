import 'package:flutter/material.dart';
import 'package:wemace/core/common/sign_in_button.dart';
import 'package:wemace/core/constants/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Constants.GoogleLogoPath,
          height: 40,
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Skip',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Column(children: [
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            Constants.logoNamePath,
            height: 400,
          ),
        ),
        const Text(
          'Women Empowering Market',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 0.5),
        ),
        const Text(
          'And Connecting Enterprises',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 0.5),
        ),
        const SizedBox(
          height: 10,
        ),
        const SignInButton()
      ]),
    );
  }
}
