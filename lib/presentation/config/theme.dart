import 'package:flutter/material.dart';
import 'package:movies_app/presentation/core/utils/colors_manager.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: ColorsManager.yellow),
      centerTitle: true,
      backgroundColor: ColorsManager.mainDark,
      elevation: 0,
    ),
    scaffoldBackgroundColor: ColorsManager.mainDark,
  );
}
