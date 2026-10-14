import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.black,
      primaryColor: AppColors.gold,
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.black,
        elevation: 0,
        centerTitle: false,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.white),
        bodyMedium: TextStyle(color: AppColors.grayText),
      ),
    );
  }
}
