import 'package:flutter/material.dart';
import 'package:wemace/theme/pallete.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Pallete.blackColor),
        strokeWidth: 3,
      ),
    );
  }
}
