import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Container,
        Widget,
        showModalBottomSheet;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetStyle {
  static void showModalsBottomSheet(BuildContext context, Widget child) {
    showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            Container(
              height: 500.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(CommonStyle.borderRadius),
                color: AppColors.cardSecondayColor,
              ),
              child: child,
            ),
          ],
        );
      },
    );
  }
}
