import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();
  static const TextStyle headline = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 21,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle subTitle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: AppColors.textSecondary,
  );
}
