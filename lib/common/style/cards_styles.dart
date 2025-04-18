import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:event_app/common/widgets/clipper_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        BorderRadius,
        BuildContext,
        Card,
        CircleAvatar,
        Colors,
        EdgeInsets,
        Icon,
        IconButton,
        Padding,
        RoundedRectangleBorder,
        Text,
        VoidCallback,
        Widget;

class CardThemees {
  static Card createEmptyCard(BuildContext context, Widget child) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CommonStyle.borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        child: child,
      ),
    );
  }

  static Card venueCard(
    BuildContext context,
    String day,
    String date,
    String month,
    String year,
    String dateTime,
    String location,
    Icon dateTimeIcon,
    Icon locationIcon,
    Icon icon,
    Icon actionIcon,
    VoidCallback onTap,
  ) {
    final textTheme = TextThemes.createTextTheme(context);
    return Card(
      elevation: 3,
      color: AppColors.cardBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CommonStyle.borderRadius),
      ),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            Container(
              width: 100,
              padding: const EdgeInsets.symmetric(
                vertical: CommonStyle.contanersPadding,
              ),
              decoration: BoxDecoration(
                color: AppColors.brandPrimaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(day.substring(0, 3), style: textTheme.titleMedium),
                  SizedBox(height: 2),
                  Text(date, style: textTheme.headlineSmall),
                  SizedBox(height: 2),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(month.substring(0, 3), style: textTheme.titleMedium),
                      const SizedBox(width: 5),
                      Text(year, style: textTheme.titleMedium),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              width: 10,
              child: ClipPath(
                clipper: VerticalWaveClipper(),
                child: Container(color: AppColors.brandPrimaryColor),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: CommonStyle.contanersPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      dateTimeIcon,
                      Text(dateTime, style: textTheme.titleMedium),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      locationIcon,
                      Text(location, style: textTheme.titleMedium),
                    ],
                  ),
                  Row(
                    children: [
                      icon,
                      Text('Map', style: textTheme.titleMedium),
                      SizedBox(width: 180),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColors.brandPrimaryColor,
                        child: IconButton(
                          onPressed: onTap,
                          icon: actionIcon,
                          iconSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
