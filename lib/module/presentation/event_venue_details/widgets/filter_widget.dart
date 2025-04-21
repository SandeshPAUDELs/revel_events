import 'package:event_app/common/style/button_styles.dart';
import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:event_app/core/config/themes/text_field_theme.dart';
import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(
        horizontal: CommonStyle.screenPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Filters', style: textTheme.bodySmall),
          SizedBox(height: 8),
          Divider(color: AppColors.strokeColor, thickness: 2),
          SizedBox(height: 8),
          Text('Selected Filters', style: textTheme.bodySmall),
          SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            itemCount: selectedFilters.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
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
                            size: 12,
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
          SizedBox(height: 4),
          Text('Venue', style: textTheme.bodySmall),
          SizedBox(height: 4),
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
                      size: 20,
                    ),
                    () {},
                  ),
                  // trailing: Icon(Icons.abc),
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

          Container(
            color: AppColors.cardBackgroundColor,
            padding: const EdgeInsets.symmetric(
              vertical: CommonStyle.screenPadding,
            ),
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
                    style: textTheme.titleMedium!.copyWith(
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
      ),
    );
  }
}
