import 'package:event_app/common/style/button_styles.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class BottonNavWidget extends StatelessWidget {
  const BottonNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);
    return Container(
        color: AppColors.cardBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Rs 10,000 ',
                  style: textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w700
                  ),
                  
                ),
                Text('onwards', 
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ButtonThemes.elevateButtonStyl(
                context,
                AppColors.textPrimaryColor,
                AppColors.buttonlevelSecondaryColor,
              ),
              onPressed: () {},
              child: Text(
                'Buy Ticket',
                style: textTheme.titleMedium!.copyWith(
                  color: AppColors.buttonlevelSecondaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
  }
}