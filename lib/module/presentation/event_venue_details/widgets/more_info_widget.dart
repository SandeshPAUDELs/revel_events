import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class MoreInfoWidget extends StatelessWidget {
  const MoreInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('More Info', style: textTheme.bodySmall),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.access_time_outlined, color: AppColors.textPrimaryColor),
            const SizedBox(width: 5),
            Text('Outdoor Events', style: textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.access_time_outlined, color: AppColors.textPrimaryColor),
            const SizedBox(width: 5),
            Text('7:15 PM - 10:15 PM', style: textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.access_time_outlined, color: AppColors.textPrimaryColor),
            const SizedBox(width: 5),
            Text('Nepali, English', style: textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.access_time_outlined, color: AppColors.textPrimaryColor),
            const SizedBox(width: 5),
            Text('18 yrs +', style: textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
