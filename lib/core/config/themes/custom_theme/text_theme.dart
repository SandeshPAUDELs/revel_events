import 'package:event_app/core/config/themes/colors.dart';
import 'package:flutter/material.dart'
    show BuildContext, FontWeight, TextOverflow, TextStyle, TextTheme;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextThemes {
  static TextTheme createTextTheme(BuildContext context) {
    return TextTheme(
      headlineMedium: TextStyle(
        fontSize: 32.sp,
        color: AppColors.textPrimaryColor,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        fontSize: 24.sp,
        color: AppColors.textPrimaryColor,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w500,
      ),

      bodySmall: TextStyle(
        fontSize: 20.sp,
        color: AppColors.textPrimaryColor,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w500,
      ),

      titleLarge: TextStyle(
        color: AppColors.textPrimaryColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.ellipsis,
      ),

      titleMedium: TextStyle(
        fontSize: 16.sp,
        color: AppColors.textPrimaryColor,
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.ellipsis,
      ),

      titleSmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: AppColors.textPrimaryColor,
        overflow: TextOverflow.ellipsis,
      ),

      bodyMedium: TextStyle(
        fontSize: 12.sp,
        height: 1.5,
        color: AppColors.textPrimaryColor,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
