import 'package:event_app/common/style/button_styles.dart';
import 'package:event_app/common/style/events_container.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class DesccribeEvents extends StatelessWidget {
  const DesccribeEvents({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);
    final describingEvent = [
      {
        'location': 'Lakeside-06, Pokhara',
        'date': 'August 4, 2024 - August 10, 2024',
        'organizer': 'REVEL',
        'price': 'Rs.10,000 - Rs.50,000',
        'likes': '1000',
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ContainerStyles.createContainer(
              context,
              'High in Demand',
              AppColors.brandPrimaryColor,
            ),
            const SizedBox(width: 8),
            ContainerStyles.createContainer(
              context,
              'Limited Booking',
              AppColors.brandPrimaryColor,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            ContainerStyles.createContainer(
              context,
              'Exclusive',
              AppColors.textSecondaryColor,
            ),
            const SizedBox(width: 8),
            ContainerStyles.createContainer(
              context,
              'Pop',
              AppColors.textSecondaryColor,
            ),
            const SizedBox(width: 8),
            ContainerStyles.createContainer(
              context,
              'Music Show',
              AppColors.textSecondaryColor,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: AppColors.textPrimaryColor,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  describingEvent[0]['location']!,
                  style: textTheme.titleSmall,
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: AppColors.textPrimaryColor,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(describingEvent[0]['date']!, style: textTheme.titleSmall),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Text(
                  describingEvent[0]['organizer']!,
                  style: textTheme.bodyMedium,
                ),
                const SizedBox(width: 4),
                Text(
                  'Organized by ${describingEvent[0]['organizer']!}',
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.brandPrimaryColor,
                  radius: 10,
                  child: Icon(
                    Icons.currency_rupee_sharp,
                    color: AppColors.textPrimaryColor,
                    size: 11,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  describingEvent[0]['price']!,
                  style: textTheme.bodyMedium!.copyWith(
                    color: AppColors.brandPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Divider(color: AppColors.textSecondaryColor, thickness: 1),
        const SizedBox(height: 10),
        Text(
          'Click on Interested to stay updated about this event.',
          maxLines: 2,
          style: textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.thumb_up_sharp,
                        color: AppColors.brandPrimaryColor,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        describingEvent[0]['likes']!,
                        style: textTheme.titleSmall!.copyWith(
                          color: AppColors.textPrimaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'People have shown interest recently',
                    maxLines: 2,
                    style: textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 3,
              child: ElevatedButton(
                onPressed: () => print('interests'),
                style: ButtonThemes.elevateButtonStyleforStroke(
                  context,
                  AppColors.buttonlevelSecondaryColor,
                  AppColors.textSecondaryColor,
                ),
                child: const Text('Interested'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
