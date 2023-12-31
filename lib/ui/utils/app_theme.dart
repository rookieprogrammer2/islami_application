import 'package:flutter/material.dart';
import 'package:islami_application/ui/utils/app_colors.dart';

abstract class AppTheme {
  static const TextStyle appBarTextStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.accent,
  );

  static const TextStyle SuraNameColumnTextStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.accent,
  );

}