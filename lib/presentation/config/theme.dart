import 'package:flutter/material.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: ColorsManager.mainDark,
  );
}
