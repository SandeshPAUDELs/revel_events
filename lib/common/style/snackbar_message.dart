import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class SnackBarThem {
  static void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: TextThemes.createTextTheme(context).bodyMedium?.copyWith(
            color: AppColors.brandPrimaryColor,
              ),
        ),
        backgroundColor: AppColors.textPrimaryColor,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 1000),
      
      ),
    );
  }
}