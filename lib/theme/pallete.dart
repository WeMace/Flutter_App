import 'package:flutter/material.dart';

class Pallete {
  // Color Pallete
  static const blackColor = Color.fromRGBO(48, 10, 36, 1); //Primary
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
      titleTextStyle: TextStyle(
        color: whiteColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: drawerColor,
      elevation: 0,
      iconTheme: IconThemeData(color: whiteColor),
    ),
    textTheme: TextTheme(
      bodySmall: const TextStyle(color: whiteColor),
      bodyMedium: const TextStyle(color: whiteColor),
      bodyLarge: const TextStyle(color: whiteColor),
      labelSmall: const TextStyle(color: whiteColor),
      labelMedium: const TextStyle(color: whiteColor),
      labelLarge: const TextStyle(color: whiteColor),
      displaySmall: const TextStyle(color: whiteColor),
      displayMedium: const TextStyle(color: whiteColor),
      displayLarge: const TextStyle(color: whiteColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: whiteColor, backgroundColor: blackColor, // Text color
      ),
    ),
    dividerTheme: DividerThemeData(
      color: whiteColor,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: blackColor,
      shadowColor: greyColor,
    ),
    primaryColor: whiteColor,
    colorScheme: ColorScheme(
      background: blackColor,
      brightness: Brightness.dark,
      primary: blackColor,
      onPrimary: whiteColor,
      secondary: greyColor,
      onSecondary: whiteColor,
      error: whiteColor,
      onError: blackColor,
      onBackground: whiteColor,
      surface: greyColor,
      onSurface: whiteColor,
    ),
  );
  static var lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: whiteColor,
    cardColor: greyColor,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: blackColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: blackColor, // Changed to black
      ),
    ),
    textTheme: TextTheme(
      bodySmall: const TextStyle(color: drawerColor),
      bodyMedium: const TextStyle(color: drawerColor),
      bodyLarge: const TextStyle(color: drawerColor),
      labelSmall: const TextStyle(color: drawerColor),
      labelMedium: const TextStyle(color: drawerColor),
      labelLarge: const TextStyle(color: drawerColor),
      displaySmall: const TextStyle(color: drawerColor),
      displayMedium: const TextStyle(color: drawerColor),
      displayLarge: const TextStyle(color: drawerColor),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: whiteColor,
      shadowColor: greyColor,
    ),
    dividerTheme: DividerThemeData(
      color: drawerColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: blackColor,
        backgroundColor: whiteColor, // Text color
      ),
    ),
    primaryColor: blackColor,
    colorScheme: ColorScheme(
      background: whiteColor,
      brightness: Brightness.light,
      primary: whiteColor,
      onPrimary: drawerColor,
      secondary: greyColor,
      onSecondary: drawerColor,
      error: blackColor,
      onError: whiteColor,
      onBackground: blackColor,
      surface: greyColor,
      onSurface: drawerColor,
    ),
  );
}
