import 'package:flutter/material.dart';
import '../theme/colors.dart';

final ThemeData themeData = ThemeData(
  primaryColor: TRestColors.primary,
  colorScheme: ColorScheme.fromSeed(
    seedColor: TRestColors.primary,
    background: TRestColors.primaryDark2,
    onBackground: Colors.white,
    primary: TRestColors.primary,
    secondary: TRestColors.secondary,
    tertiary: TRestColors.tertiary,
    shadow: TRestColors.primaryDark3,
    surface: TRestColors.primary,
    onSurface: Colors.white,
    outline: TRestColors.primaryDark3,
  ),
  useMaterial3: true,
);
