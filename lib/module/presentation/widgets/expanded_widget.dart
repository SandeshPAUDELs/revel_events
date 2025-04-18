import 'package:event_app/common/style/button_styles.dart';
import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:event_app/common/widgets/dashes_painter.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final String data =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

    final textTheme = TextThemes.createTextTheme(context);
    return Padding(
      padding: const EdgeInsets.all(CommonStyle.screenPadding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('First Phase', style: textTheme.titleLarge),
                    const SizedBox(height: 5),
                    Text('Rs  10000/person', style: textTheme.titleSmall),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonThemes.incrementDecrementButton(
                      context,
                      Icon(Icons.remove, color: AppColors.brandPrimaryColor),
                      () {},
                    ),
                    SizedBox(width: 5),
                    Text('1', style: textTheme.titleLarge),
                    SizedBox(width: 5),
                    ButtonThemes.incrementDecrementButton(
                      context,
                      Icon(Icons.add, color: AppColors.brandPrimaryColor),
                      () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          Card(
            color: AppColors.buttonlevelSecondaryColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColors.strokeColor, width: 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Other Details', style: textTheme.titleLarge),
                const SizedBox(height: 5),
                ExpandableText(
                  backgroundColor: AppColors.buttonlevelSecondaryColor,
                  textWidget: Text(
                    data,
                    maxLines: 2,
                    style: textTheme.titleSmall,
                  ),
                  helper: Helper.text,
                  helperTextStyle: textTheme.bodyMedium!.copyWith(
                    color: AppColors.brandPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: CustomPaint(painter: DashedLinePainter()),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Second Phase', style: textTheme.titleLarge),
                    const SizedBox(height: 5),
                    Text('Rs 20000/person', style: textTheme.titleSmall),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ButtonThemes.elevateButtonStyl(
                        context,
                        AppColors.textPrimaryColor,
                        AppColors.brandPrimaryColor,
                      ),
                      onPressed: () {},
                      child: Text(
                        'Add',
                        style: textTheme.bodyMedium!.copyWith(
                          color: AppColors.brandPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Card(
            color: AppColors.buttonlevelSecondaryColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColors.strokeColor, width: 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Other Details', style: textTheme.titleLarge),
                const SizedBox(height: 5),

                ExpandableText(
                  backgroundColor: AppColors.buttonlevelSecondaryColor,
                  textWidget: Text(
                    data,
                    maxLines: 2,
                    style: textTheme.titleSmall,
                  ),
                  helper: Helper.text,
                  helperTextStyle: textTheme.bodyMedium!.copyWith(
                    color: AppColors.brandPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
