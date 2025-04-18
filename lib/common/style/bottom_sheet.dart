import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:flutter/material.dart'
    show
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Container,
        Widget,
        showModalBottomSheet;

class BottomSheetStyle {
  static void showReevModalBottomSheet(BuildContext context, Widget child) {
    showModalBottomSheet(
      context: context,
      builder:
          (context) => Container(
            
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(CommonStyle.borderRadius),
              color: AppColors.cardSecondayColor,
            ),
            child: child,
          ),
    );
  }
}
