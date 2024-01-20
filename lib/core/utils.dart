import 'package:flutter/material.dart';
import 'package:wemace/theme/pallete.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: Pallete.blackColor, //light-mode
    ));
}
