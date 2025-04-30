import 'package:event_app/common/style/button_styles.dart';
import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OrganizerWidget extends StatelessWidget {
  final String title, organizer, followers;
  final NetworkImage image;

  const OrganizerWidget({
    super.key,
    required this.title,
    required this.organizer,
    required this.followers,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Meet the Organizer', style: textTheme.titleLarge),
        SizedBox(height: CommonStyle.horizontalGapBtwnRows),
        Card(
          color: AppColors.cardBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: CommonStyle.horizontalGap),
              CircleAvatar(
                radius: 40.r,
                backgroundImage: NetworkImage(image.url),
              ),
              SizedBox(height: CommonStyle.horizontalGapBtwnRows),
              Text(title, maxLines: 1, style: textTheme.titleLarge),
              SizedBox(height: CommonStyle.horizontalGapBtwnRows),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/follower 1.svg',
                    height: 18.h,
                    width: 18.h,
                  ),
                  SizedBox(width: CommonStyle.gapBetweenIconsAndText),
                  Text(followers, style: textTheme.titleLarge),
                ],
              ),
              SizedBox(height: CommonStyle.horizontalGapBtwnRows),
              Text(organizer, maxLines: 1, style: textTheme.titleLarge),
              SizedBox(height: CommonStyle.horizontalGapBtwnRows),
              ElevatedButton(
                style: ButtonThemes.elevateButtonStyl(
                  context,
                  AppColors.textPrimaryColor,
                  AppColors.buttonlevelSecondaryColor,
                ),
                onPressed: () {},
                child: Text(
                  'Follow',
                  style: textTheme.titleMedium!.copyWith(
                    color: AppColors.buttonlevelSecondaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: CommonStyle.horizontalGapBtwnRows),
            ],
          ),
        ),
      ],
    );
  }
}
