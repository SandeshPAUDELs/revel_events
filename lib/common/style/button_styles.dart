import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:flutter/material.dart'
    show
        BorderRadius,
        BorderSide,
        BuildContext,
        ButtonStyle,
        Color,
        EdgeInsets,
        EdgeInsetsGeometry,
        ElevatedButton,
        Icon,
        MediaQuery,
        RoundedRectangleBorder,
        SizedBox,
        VoidCallback;

class ButtonThemes {
  static EdgeInsetsGeometry responsivehalfPadding(BuildContext context) {
    double paddingPercent = 0.05; // 5% of the screen width
    double paddingHorizontal =
        MediaQuery.sizeOf(context).width * paddingPercent;
    double paddingVertical = 16.0;
    return EdgeInsets.symmetric(
      horizontal: paddingHorizontal,
      vertical: paddingVertical,
    );
  }

  static SizedBox incrementDecrementButton(
    BuildContext context,
    Icon icon,
    VoidCallback onTap,
  ) {
    return SizedBox(
      height: 20,
      width: 20,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.textPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(CommonStyle.smallRadius),
          ),
          padding: EdgeInsets.zero,
        ),
        child: icon,
      ),
    );
  }

  static ButtonStyle elevateButtonStyl(
    BuildContext context,
    Color backgroundColor,
    Color textColor,
  ) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: textColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CommonStyle.borderRadius),
      ),
      padding: responsivehalfPadding(context),
    );
  }

  static ButtonStyle elevateButtonStyleforStroke(
    BuildContext context,
    Color backgroundColor,
    Color textColor,
  ) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: textColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CommonStyle.borderRadius),
        side: BorderSide(color: AppColors.strokeColor, width: 1),
      ),
      padding: responsivehalfPadding(context),
    );
  }
}
