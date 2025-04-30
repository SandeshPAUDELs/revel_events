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
        RoundedRectangleBorder,
        SizedBox,
        VoidCallback;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonThemes {
  static EdgeInsetsGeometry responsivehalfPadding(BuildContext context) {
    double paddingHorizontal = 40.w;
    double paddingVertical = 7.h;
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
      height: 30.h,
      width: 30.w,
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

  static ButtonStyle elevateButtonWithBorder(
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

  static ButtonStyle elevateButtonStyleForOrganizer(
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
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 7.h),
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
      padding: EdgeInsets.symmetric(
        horizontal: CommonStyle.contanersPadding,
        vertical: CommonStyle.contanersPadding,
      ),
    );
  }
}
