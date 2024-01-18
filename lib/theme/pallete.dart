import 'package:flutter/material.dart';

class Pallete {
  // Color Pallete
  static const blackColor = Color.fromRGBO(1, 1, 1, 1); //Primary
  static const greyColor = Color.fromRGBO(188, 33, 152, 1); //Secondary
  static const drawerColor = Color.fromRGBO(18, 18, 18, 1);
  static const whiteColor = Color.fromRGBO(245, 229, 255, 1);
  static var redColor = Colors.red.shade500;
  static var blueColor = Colors.blue.shade300;

  //Themes
  static var darkModeAppTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: blackColor,
    cardColor: greyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: drawerColor,
      iconTheme: IconThemeData(color: whiteColor),
    ),
    drawerTheme: const DrawerThemeData(backgroundColor: drawerColor),
    primaryColor: redColor,
    backgroundColor: drawerColor,
  );

  static var lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: whiteColor,
    cardColor: greyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: greyColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: whiteColor,
    ),
    primaryColor: redColor,
    backgroundColor: whiteColor,
  );
}
