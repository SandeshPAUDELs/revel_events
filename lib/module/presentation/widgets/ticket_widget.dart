import 'package:event_app/common/style/bottom_sheet.dart';
import 'package:event_app/common/style/cards_styles.dart';
import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:event_app/module/presentation/cubit/expandable_card_cubit.dart';
import 'package:event_app/module/presentation/widgets/expanded_widget.dart';
import 'package:event_app/module/presentation/widgets/filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final itemList = 5;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final expandCubit = context.read<ExpandCubit>();
      if (expandCubit.state.isEmpty) {
        expandCubit.initializeList(itemList);
      }
    });
    final textTheme = TextThemes.createTextTheme(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 6,
              child: Text('Select Venues', style: textTheme.headlineSmall),
            ),

            Expanded(
              child: SizedBox(
                height: 30,
                width: 30,
                child: ElevatedButton(
                  onPressed: () {
                    BottomSheetStyle.showReevModalBottomSheet(
                      context,
                      const FilterWidget(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.cardBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        CommonStyle.smallRadius,
                      ),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Icon(
                    size: 20,
                    Icons.filter_1_sharp,
                    color: AppColors.textPrimaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Stack(
          alignment: Alignment.center,
          children: [
            Divider(color: AppColors.strokeColor, thickness: 1),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: CommonStyle.screenPadding,
              ),
              decoration: BoxDecoration(
                color: AppColors.buttonlevelSecondaryColor,
              ),
              child: Text('Pokhara', style: textTheme.titleSmall),
            ),
          ],
        ),
        BlocBuilder<ExpandCubit, List<bool>>(
          builder: (context, isExpandedList) {
            return ListView.builder(
              itemCount: itemList,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CardThemees.venueCard(
                      context,
                      'Friday',
                      '23',
                      'Janaury',
                      '2024',
                      '7:15 PM - 10:15 PM ',
                      'Catwalk, Lakeside : Pokhara',
                      Icon(Icons.safety_check_outlined),
                      Icon(Icons.location_on_outlined),
                      Icon(Icons.check_circle_outline),
                      Icon(Icons.local_activity),
                      () {
                        if (index < isExpandedList.length) {
                          context.read<ExpandCubit>().toggleExpand(index);
                        }
                      },
                    ),
                    if (index < isExpandedList.length && isExpandedList[index])
                      ExpandedWidget(),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
