import 'package:flutter/services.dart';

import '../core/app_export.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColor.primaryColor,
    hintColor: AppColor.secondaryColor,
    scaffoldBackgroundColor: AppColor.whiteColor,
    fontFamily: 'Montserrat',
    colorScheme: ColorSchemes.primaryColorScheme,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      //color: AppColor.primaryColor,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    textTheme: TextThemes.textTheme(ColorSchemes.primaryColorScheme),
    // Add more text styles as needed
  );
}

class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: AppColor.primaryColor,
    secondary: AppColor.secondaryColor,
  );
}

class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: AppColor.textColor,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: AppColor.textColor,
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
        bodySmall: TextStyle(
          color: AppColor.textColor,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: AppColor.textColor,
          fontSize: 40,
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          color: AppColor.textColor,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: const TextStyle(
          color: AppColor.primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: AppColor.textColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: AppColor.textColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      );
}
