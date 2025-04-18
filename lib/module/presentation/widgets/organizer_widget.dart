import 'package:event_app/common/style/button_styles.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

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
        Text('Meet the Organizer', style: textTheme.bodySmall),
        Card(
          color: AppColors.cardBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(image.url),
              ),
              const SizedBox(height: 20),
              Text(title, maxLines: 1, style: textTheme.bodySmall),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.verified_user, color: AppColors.textPrimaryColor),
                  Text(followers, style: textTheme.titleLarge),
                ],
              ),
              const SizedBox(height: 5),
              Text(organizer, maxLines: 1, style: textTheme.titleLarge),
              const SizedBox(height: 5),
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
            ],
          ),
        ),
      ],
    );
  }
}
