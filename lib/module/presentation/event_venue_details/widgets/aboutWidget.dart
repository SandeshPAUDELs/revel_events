import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';

class AboutUsWidget extends StatelessWidget {
  final String aboutUs;
  const AboutUsWidget({super.key, required this.aboutUs});
  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('About Us', style: textTheme.titleLarge),
        SizedBox(height: CommonStyle.verticalGapBetweenWidgets),
        ExpandableText(
          boxShadow: [
            BoxShadow(
              color: AppColors.buttonlevelSecondaryColor,
              blurRadius: 0,
              spreadRadius: 0,
            ),
          ],

          backgroundColor: AppColors.buttonlevelSecondaryColor,
          textWidget: Text(
            aboutUs,
            maxLines: 3,  
            style: textTheme.titleSmall,
            textAlign: TextAlign.justify,
          ),
          helper: Helper.text,
          helperTextStyle: textTheme.bodyMedium!.copyWith(
            color: AppColors.brandPrimaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: CommonStyle.horizontalGap),
      ],
    );
  }
}
