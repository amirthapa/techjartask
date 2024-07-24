import 'package:flutter/material.dart';

import 'theme.dart';

class AppTheme {
  static final ThemeData _lightTheme = ThemeData(
    useMaterial3: false,
    fontFamily: AppFonts.fontFamily,
    brightness: Brightness.light,
    cardColor: AppColors.cardBackgroundColor,

    primaryColor: AppColors.primaryColor,
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black, selectionColor: AppColors.primaryColor),
    buttonTheme: _getButtonTheme,
    canvasColor: Colors.white,
    //For curve of bottomsheetdialog
    hintColor: const Color(0xff585858),
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Colors.white),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Color(0xffffffff)),
    textTheme: _getTextTheme,
    tabBarTheme: _getTabBarTheme,
    appBarTheme: _getAppBarTheme,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: AppColors.primaryColor)
        .copyWith(background: AppColors.primaryDarkColor),
  );

  static ThemeData get getLightAppThemeData => _lightTheme;

  static AppBarTheme get _getAppBarTheme => const AppBarTheme(
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryColor,
      );

  static ButtonThemeData get _getButtonTheme {
    return ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      height: 51,
      textTheme: ButtonTextTheme.primary,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular((16)),
      ),
    );
  }

  static TabBarTheme get _getTabBarTheme {
    return const TabBarTheme(
      indicatorColor: AppColors.primaryColor,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: TextStyle(
          fontFamily: "Poppins",
          fontSize: AppFonts.titleSmallFontSize,
          fontWeight: AppFonts.titleSmallFontWeight),
      unselectedLabelStyle: TextStyle(
          fontFamily: "Poppins",
          fontSize: AppFonts.titleSmallFontSize,
          fontWeight: AppFonts.titleSmallFontWeight),
    );
  }

  static TextTheme get _getTextTheme {
    Color titleColor = AppColors.bigTitleColor;
    Color bodyColor = AppColors.bodyColor;
    return TextTheme(
      titleLarge: TextStyle(
          fontSize: AppFonts.titleLargeFontSize,
          fontWeight: AppFonts.titleLargeFontWeight,
          color: titleColor),
      titleMedium: TextStyle(
          fontSize: AppFonts.titleMediumFontSize,
          fontWeight: AppFonts.titleMediumFontWeight,
          color: titleColor),
      titleSmall: TextStyle(
          fontSize: AppFonts.titleSmallFontSize,
          fontWeight: AppFonts.titleSmallFontWeight,
          color: titleColor),
      bodyLarge: TextStyle(
          fontSize: AppFonts.bodyLargeFontSize,
          fontWeight: AppFonts.bodyLargeFontWeight,
          fontStyle: FontStyle.normal,
          color: bodyColor),
      bodyMedium: TextStyle(
          fontSize: AppFonts.bodyMediumFontSize,
          fontWeight: AppFonts.bodyMediumFontWeight,
          fontStyle: FontStyle.normal,
          color: bodyColor),
      bodySmall: TextStyle(
          fontSize: AppFonts.bodySmallFontSize,
          fontWeight: AppFonts.bodySmallFontWeight,
          fontStyle: FontStyle.normal,
          color: bodyColor),
    );
  }

  static TextStyle? getBodyLargeStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge;
  }

  static TextStyle? getBodyMediumStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium;
  }

  static TextStyle? getBodySmallStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall;
  }

  static TextStyle? getTitleLargeStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge;
  }

  static TextStyle? getTitleMediumStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium;
  }

  static TextStyle? getTitleSmallStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall;
  }
}
