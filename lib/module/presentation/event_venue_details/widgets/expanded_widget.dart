import 'package:event_app/common/style/button_styles.dart';
import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:event_app/common/widgets/dashes_painter.dart';
import 'package:event_app/module/presentation/event_venue_details/cubits/event_venue_detail_cubit.dart';
import 'package:event_app/module/presentation/event_venue_details/cubits/event_venue_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);

    return BlocBuilder<EventVenueDetailCubit, EventVenueDetailsState>(
      builder: (context, state) {
        if (state is EventVenueDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is EventVenueDetailsLoaded) {
          final ticketOptions = state.eventVenueDetails[0].ticket_options ?? [];

          return ListView.builder(
            itemCount: ticketOptions.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final ticket = ticketOptions[index];
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: CommonStyle.screenPadding,
                  vertical: CommonStyle.screenPadding,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ticket.name ?? 'Ticket Phase',
                              style: textTheme.titleLarge,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '${ticket.amount}/${ticket.amount_type}',
                              style: textTheme.titleSmall,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ButtonThemes.incrementDecrementButton(
                              context,
                              Icon(
                                Icons.remove,
                                size: 14.w,
                                color: AppColors.brandPrimaryColor,
                              ),
                              () {}, // Decrement logic
                            ),
                            const SizedBox(width: 5),
                            Text(
                              ticket.number_of_participant.toString(),
                              style: textTheme.titleLarge,
                            ),
                            const SizedBox(width: 5),
                            ButtonThemes.incrementDecrementButton(
                              context,
                              Icon(
                                Icons.add,
                                size: 14.w,
                                color: AppColors.brandPrimaryColor,
                              ),
                              () {}, // Increment logic
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Card(
                      color: AppColors.buttonlevelSecondaryColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: AppColors.strokeColor,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(CommonStyle.contanersPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Other Details', style: textTheme.titleLarge),
                            SizedBox(height: 4.h),
                            Html(
                              data:
                                  state
                                      .eventVenueDetails[0]
                                      .ticket_options![index]
                                      .description ??
                                  '<p>No description available</p>',

                              style: {
                                "p": Style(color: AppColors.textPrimaryColor),
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      width: double.infinity,
                      child: CustomPaint(painter: DashedLinePainter()),
                    ),
                  ],
                ),
              );
            },
          );
        } else if (state is EventVenueDetailsError) {
          return const Center(child: Text('Error loading venue details'));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
