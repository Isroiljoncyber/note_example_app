import 'package:flutter/material.dart';
import 'package:note_example_app/assets/constants/app_colors.dart';

abstract class AppTheme {
  static ThemeData dark() => ThemeData(
        scaffoldBackgroundColor: AppColors.mainBlack,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.mainBlack,
        ),
      );
}
