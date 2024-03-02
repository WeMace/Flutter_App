import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});

class Pallete {
  // Color Pallete
  static const blackColor = Color.fromRGBO(48, 10, 36, 1); //Primary
  static const greyColor = Color.fromRGBO(240, 32, 118, 1); //Secondary
  static const drawerColor = Color.fromRGBO(18, 18, 18, 1);
  static const whiteColor = Color.fromRGBO(245, 229, 255, 1);
  static var redColor = Colors.red.shade500;
  static var blueColor = Colors.blue.shade300;

  // palele

  static const primaryColor = Color.fromRGBO(65, 18, 99, 1);
  static const onPrimaryColor = Color.fromRGBO(255, 255, 255, 1);
  static const secondaryColor = Color.fromRGBO(234, 67, 53, 1);
  static const onSecondaryColor = Color.fromRGBO(255, 255, 255, 1);
  static const backgroundColor = Color.fromRGBO(245, 229, 255, 1);
  static const onBackgroundColor = Color.fromRGBO(2, 0, 0, 1);
  static const surfaceColor = Color.fromRGBO(255, 255, 255, 1);
  static const onSurfaceColor = Color.fromRGBO(2, 0, 0, 1);
  static const errorColor = Color.fromRGBO(242, 180, 61, 1);
  static const onErrorColor = Color.fromRGBO(255, 255, 255, 1);

  //Themes
  static var lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: backgroundColor,
    cardColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: onPrimaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: primaryColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: onPrimaryColor, // Changed to black
      ),
    ),
    // textTheme: TextTheme(
    //   bodySmall: const TextStyle(color: drawerColor),
    //   bodyMedium: const TextStyle(color: drawerColor),
    //   bodyLarge: const TextStyle(color: drawerColor),
    //   labelSmall: const TextStyle(color: drawerColor),
    //   labelMedium: const TextStyle(color: drawerColor),
    //   labelLarge: const TextStyle(color: drawerColor),
    //   displaySmall: const TextStyle(color: drawerColor),
    //   displayMedium: const TextStyle(color: drawerColor),
    //   displayLarge: const TextStyle(color: drawerColor),
    // ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: backgroundColor,
      shadowColor: onBackgroundColor,
    ),
    dividerTheme: DividerThemeData(
      color: onBackgroundColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: onBackgroundColor,
        backgroundColor: backgroundColor, // Text color
      ),
    ),
    primaryColor: primaryColor,
    colorScheme: ColorScheme(
      background: backgroundColor,
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: onPrimaryColor,
      secondary: secondaryColor,
      onSecondary: onSecondaryColor,
      error: errorColor,
      onError: onErrorColor,
      onBackground: onBackgroundColor,
      surface: surfaceColor,
      onSurface: onSurfaceColor,
    ),
  );
  static var darkModeAppTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: primaryColor,
    cardColor: secondaryColor,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: backgroundColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: primaryColor,
      elevation: 0,
      iconTheme: IconThemeData(color: backgroundColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          foregroundColor: onSecondaryColor,
          backgroundColor: secondaryColor,
          textStyle: TextStyle(color: onSecondaryColor) // Text color
          ),
    ),
    dividerTheme: DividerThemeData(
      color: primaryColor,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: backgroundColor,
      // shadowColor: onBackgroundColor,
    ),
    listTileTheme: ListTileThemeData(
      textColor: onSurfaceColor,
      iconColor: onBackgroundColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: onBackgroundColor,
        size: 32,
      ),
      unselectedIconTheme: IconThemeData(
        color: onBackgroundColor,
        size: 32,
      ),
    ),
  );
}

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeMode _mode;
  ThemeNotifier({ThemeMode mode = ThemeMode.dark})
      : _mode = mode,
        super(
          Pallete.darkModeAppTheme,
        ) {
    getTheme();
  }

  ThemeMode get mode => _mode;

  void getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme');

    if (theme == 'light') {
      _mode = ThemeMode.light;
      state = Pallete.lightModeAppTheme;
    } else {
      _mode = ThemeMode.dark;
      state = Pallete.darkModeAppTheme;
    }
  }

  void toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_mode == ThemeMode.dark) {
      _mode = ThemeMode.light;
      state = Pallete.lightModeAppTheme;
      prefs.setString('theme', 'light');
    } else {
      _mode = ThemeMode.dark;
      state = Pallete.darkModeAppTheme;
      prefs.setString('theme', 'dark');
    }
  }
}
