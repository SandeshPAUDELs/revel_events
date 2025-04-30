import 'package:event_app/common/style/button_styles.dart';
import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:event_app/core/config/themes/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);
    final filters = [
      {'name': 'pokhara', 'isSelected': true},
      {'name': 'pokhara', 'isSelected': true},
      {'name': 'kathmandu', 'isSelected': false},
    ];

    final selectedFilters =
        filters.where((filter) => filter['isSelected'] == true).toList();

    final controller = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: CommonStyle.contanersPadding),
      child: Column(
        mainAxisSize:
            MainAxisSize.min,
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                  Wrap(
                    spacing: 8.w,
                    runSpacing: 8.h,
                    children:
                        selectedFilters.map((filter) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: CommonStyle.screenPadding,
                              vertical: 0.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.cardBackgroundColor,
                              borderRadius: BorderRadius.circular(
                                CommonStyle.smallRadius,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  filter['name'] as String,
                                  style: textTheme.titleMedium,
                                ),
                                SizedBox(width: 2.w),
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
                          );
                        }).toList(),
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
                  SizedBox(height: CommonStyle.horizontalGap),

                  Column(
                    children:
                        filters.map((filter) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                CommonStyle.borderRadius,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  filter['name'] as String,
                                  style: textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    filter['isSelected'] as bool
                                        ? Icons.check_box
                                        : Icons.check_box_outline_blank,
                                    color: AppColors.brandPrimaryColor,
                                    size: 20.h,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                  ),

                  SizedBox(height: 10.h),

                  Row(
                    children: [
                      Text(
                        'ShowMore',
                        style: textTheme.bodyMedium!.copyWith(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          decorationColor: AppColors.textPrimaryColor,
                          decorationThickness: 2,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      SvgPicture.asset(
                        'assets/icons/chevron-right.svg',
                        height: 16.h,
                        width: 16.w,
                      ),
                    ],
                  ),
                  Divider(color: AppColors.strokeColor, thickness: 2),
                  SizedBox(height: CommonStyle.horizontalGap),
                ],
              ),
            ),
          ),

          Container(
            width: double.infinity,
            color: AppColors.cardBackgroundColor,
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonThemes.elevateButtonWithBorder(
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
                ),
                Expanded(
                  child: ElevatedButton(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class FilterWidget extends StatelessWidget {
//   const FilterWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = TextThemes.createTextTheme(context);
//     final filters = [
//       {'name': 'pokhara', 'isSelected': true},
//       {'name': 'pokhara', 'isSelected': true},
//       {'name': 'kathmandu', 'isSelected': false},
//     ];

//     final selectedFilters =
//         filters.where((filter) => filter['isSelected'] == true).toList();

//     final controller = TextEditingController();

//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: CommonStyle.contanersPadding),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: CommonStyle.verticalGapBetweenWidgets),
//           Text('Filters', style: textTheme.titleLarge),
//           SizedBox(height: CommonStyle.horizontalGap),
//           Divider(color: AppColors.strokeColor, thickness: 2),
//           SizedBox(height: CommonStyle.horizontalGap),

//           Text('Selected Filters', style: textTheme.bodySmall),
//           SizedBox(height: CommonStyle.horizontalGap),
//           Wrap(
//             spacing: 8.w,
//             runSpacing: 8.h,
//             children:
//                 selectedFilters.map((filter) {
//                   return Container(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: CommonStyle.screenPadding,
//                       vertical: 0.h,
//                     ),
//                     decoration: BoxDecoration(
//                       color: AppColors.cardBackgroundColor,
//                       borderRadius: BorderRadius.circular(
//                         CommonStyle.smallRadius,
//                       ),
//                     ),

//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           filter['name'] as String,
//                           style: textTheme.titleMedium,
//                         ),
//                         SizedBox(width: 2.w),
//                         IconButton(
//                           onPressed: () {},
//                           icon: Icon(
//                             Icons.close,
//                             size: 12.h,
//                             color: AppColors.textPrimaryColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 }).toList(),
//           ),
//           Divider(color: AppColors.strokeColor, thickness: 2),
//           SizedBox(height: CommonStyle.horizontalGap),
//           Text('Venue', style: textTheme.bodySmall),
//           SizedBox(height: CommonStyle.horizontalGap),
//           TextFieldsTheme.createTextField(
//             context,
//             controller,
//             'hintText',
//             (value) {},
//           ),
//           Expanded(
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: filters.length,
//               itemBuilder: (context, index) {
//                 return Container(
//                   padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
//                   decoration: BoxDecoration(
//                     // color: AppColors.cardBackgroundColor,
//                     borderRadius: BorderRadius.circular(
//                       CommonStyle.borderRadius,
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         filters[index]['name'] as String,
//                         style: textTheme.titleMedium!.copyWith(
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),

//                       IconButton(
//                         onPressed: () {},
//                         icon: Icon(
//                           filters[index]['isSelected'] as bool
//                               ? Icons.check_box
//                               : Icons.check_box_outline_blank,
//                           color: AppColors.brandPrimaryColor,
//                           size: 20.h,
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//           Row(
//             children: [
//               Text(
//                 'ShowMore',
//                 style: textTheme.bodyMedium!.copyWith(
//                   decoration: TextDecoration.underline,
//                   fontWeight: FontWeight.w500,
//                     fontStyle: FontStyle.normal,
//                   decorationColor: AppColors.textPrimaryColor,
//                   decorationThickness: 2,
//                 ),
//               ),
//               SizedBox(width: 2.w),
//               SvgPicture.asset(
//                 'assets/icons/chevron-right.svg',
//                 height: 16.h,
//                 width: 16.w,
//               ),
//             ],
//           ),
//           // ),
//           Divider(color: AppColors.strokeColor, thickness: 2),
//           SizedBox(height: CommonStyle.horizontalGap),

//           Container(
//             color: AppColors.cardBackgroundColor,
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     style: ButtonThemes.elevateButtonWithBorder(
//                       context,
//                       AppColors.cardBackgroundColor,
//                       AppColors.strokeColor,
//                     ),
//                     onPressed: () {},
//                     child: Text(
//                       'Clear All',
//                       style: textTheme.titleSmall!.copyWith(
//                         color: AppColors.textPrimaryColor,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),

//                   ElevatedButton(
//                     style: ButtonThemes.elevateButtonStyl(
//                       context,
//                       AppColors.textPrimaryColor,
//                       AppColors.buttonlevelSecondaryColor,
//                     ),
//                     onPressed: () {},
//                     child: Text(
//                       'Apply Filter',
//                       style: textTheme.titleSmall!.copyWith(
//                         color: AppColors.buttonlevelSecondaryColor,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
