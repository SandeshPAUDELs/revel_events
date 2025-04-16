
import 'package:event_app/core/config/themes/colors.dart';
import 'package:flutter/material.dart' show BuildContext, FontWeight, TextOverflow, TextStyle, TextTheme;

class TextThemes {
  static TextTheme createTextTheme(BuildContext context) {
    return TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        color: AppColors.textPrimaryColor,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w500,
      ),

      bodySmall: TextStyle(
        fontSize: 20,
        color: AppColors.textPrimaryColor,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w500
      ),

      titleLarge: TextStyle(
        color: AppColors.textPrimaryColor,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.ellipsis,
      ),

      titleMedium: TextStyle(
        fontSize: 16,
        color: AppColors.textPrimaryColor,
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.ellipsis,
      ),

      titleSmall: TextStyle(
        fontSize: 14,
        color: AppColors.textPrimaryColor,
        overflow: TextOverflow.ellipsis,
      ),
      
      bodyMedium: TextStyle(
        fontSize: 12,
        color: AppColors.textPrimaryColor,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}