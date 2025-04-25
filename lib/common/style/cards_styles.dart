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
        EdgeInsets,
        Padding,
        RoundedRectangleBorder,
        Text,
        TextButton,
        VoidCallback,
        Widget;
import 'package:flutter_svg/flutter_svg.dart';

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
    String monthYear,
    String dateTime,
    String location,
    SvgPicture dateTimeIcon,
    SvgPicture locationIcon,
    SvgPicture icon,
    Image actionIcon,
    VoidCallback onTap,
    VoidCallback onPressed,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(day.substring(0, 3), style: textTheme.titleMedium),
                  SizedBox(height: 2),
                  Text(date.substring(5, 7), style: textTheme.headlineMedium),
                  SizedBox(height: 2),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        monthYear.substring(8, 16),
                        style: textTheme.titleMedium,
                      ),
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
              padding: const EdgeInsets.symmetric(vertical: 15),
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
                      TextButton(
                        onPressed: onPressed,
                        child: Text('Map', style: textTheme.titleMedium),
                      ),
                      SizedBox(width: 170),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColors.textPrimaryColor,
                        child: GestureDetector(
                          onTap: onTap,
                          child: Image.asset(
                            'assets/images/Vector.png',
                            width: 15,
                            height: 15,
                          ),
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