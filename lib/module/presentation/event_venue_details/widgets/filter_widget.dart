import 'package:event_app/common/style/button_styles.dart';
import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:event_app/core/config/themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);
    final filters = [
      {'name': 'pokhara', 'isSelected': true},
      {'name': 'kathmandu', 'isSelected': false},
    ];

    final selectedFilters =
        filters.where((filter) => filter['isSelected'] == true).toList();

    final controller = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: CommonStyle.contanersPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: CommonStyle.verticalGapBetweenWidgets),
          Text('Filters', style: textTheme.titleLarge),
          SizedBox(height: CommonStyle.horizontalGap),
          Divider(color: AppColors.strokeColor, thickness: 2),
          SizedBox(height: CommonStyle.horizontalGap),

          Text('Selected Filters', style: textTheme.bodySmall),
          SizedBox(height: CommonStyle.horizontalGap),
          ListView.builder(
            shrinkWrap: true,
            itemCount: selectedFilters.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackgroundColor,
                      borderRadius: BorderRadius.circular(
                        CommonStyle.borderRadius,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          selectedFilters[index]['name'] as String,
                          style: textTheme.titleMedium,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.close,
                            size: 12.h,
                            color: AppColors.textPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Divider(color: AppColors.strokeColor, thickness: 2),
          SizedBox(height: CommonStyle.horizontalGap),
          Text('Venue', style: textTheme.bodySmall),
          SizedBox(height: CommonStyle.horizontalGap),
          TextFieldsTheme.createTextField(
            context,
            controller,
            'hintText',
            (value) {},
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(
                    filters[index]['name']! as String,
                    style: textTheme.titleLarge,
                  ),
                  trailing: TextFieldsTheme.checkboxContainerforPages(
                    context,
                    Icon(
                      filters[index]['isSelected']! as bool
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color: AppColors.brandPrimaryColor,
                      size: 20.h,
                    ),
                    () {},
                  ),
                );
              },
            ),
          ),
          Text(
            'ShowMore',
            style: textTheme.bodyMedium!.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
          Divider(color: AppColors.strokeColor, thickness: 2),
          SizedBox(height: CommonStyle.horizontalGap),

          Container(
            color: AppColors.cardBackgroundColor,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ButtonThemes.elevateButtonStyleforStroke(
                    context,
                    AppColors.cardBackgroundColor,
                    AppColors.strokeColor,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Clear All',
                    style: textTheme.titleSmall!.copyWith(
                      color: AppColors.textPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ButtonThemes.elevateButtonStyl(
                    context,
                    AppColors.textPrimaryColor,
                    AppColors.buttonlevelSecondaryColor,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Apply Filter',
                    style: textTheme.titleSmall!.copyWith(
                      color: AppColors.buttonlevelSecondaryColor,
                      fontWeight: FontWeight.w600,
                    ),
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
