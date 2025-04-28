import 'package:event_app/common/style/button_styles.dart';
import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/common/style/events_container.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:event_app/module/presentation/event_venue_details/cubits/event_venue_detail_cubit.dart';
import 'package:event_app/module/presentation/event_venue_details/cubits/event_venue_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DesccribeEvents extends StatelessWidget {
  const DesccribeEvents({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);

    return BlocBuilder<EventVenueDetailCubit, EventVenueDetailsState>(
      builder: (context, state) {
        if (state is EventVenueDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is EventVenueDetailsError) {
          return Center(child: Text(state.errorMessage));
        } else if (state is EventVenueDetailsLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Wrap(
                    spacing: CommonStyle.gap1horizontal,
                    children:
                        (state.eventVenueDetails[0].event?.category ??
                                ['High in Demand', 'Limited Booking'])
                            .map(
                              (item) => ContainerStyles.createContainer(
                                context,
                                item,
                                AppColors.brandPrimaryColor,
                              ),
                            )
                            .toList(),
                  ),
                ],
              ),
              SizedBox(height: CommonStyle.gap1Vertical),
              Row(
                children: [
                  Wrap(
                    spacing: CommonStyle.gap1horizontal,
                    children:
                        (state.eventVenueDetails[0].event?.subcategory ??
                                ['Pop', 'Rok'])
                            .map(
                              (item) => ContainerStyles.createContainer(
                                context,
                                item,
                                AppColors.textSecondaryColor,
                              ),
                            )
                            .toList(),
                  ),
                ],
              ),
              SizedBox(height: CommonStyle.gap1Vertical),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/pinched location.svg',
                        height: 14.h,
                        width: 14.w,
                      ),
                      SizedBox(width: CommonStyle.gapBetweenIconsAndText),

                      Text(
                        state.eventVenueDetails[0].venue?.name ??
                            'Unknown Venue',
                        style: textTheme.titleSmall,
                      ),
                    ],
                  ),
                  SizedBox(height: CommonStyle.gap1Vertical),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Calender.svg',
                          height: 14.h,
                          width: 14.w,
                        ),
                        SizedBox(width: CommonStyle.gapBetweenIconsAndText),
                        Expanded(
                          child: Text(
                            '${state.eventVenueDetails[0].event!.date_range!['start_datetime']?.substring(0, 16)} - ${state.eventVenueDetails[0].event!.date_range!['end_datetime']?.substring(0, 16)}',
                            style: textTheme.titleSmall,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: CommonStyle.gap1Vertical),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        child: Image.network(
                          state.eventVenueDetails[0].event?.organizer?.image ??
                              '',
                        ),
                      ),

                      SizedBox(width: CommonStyle.gapBetweenIconsAndText),
                      Text(
                        'Organized by ${state.eventVenueDetails[0].event?.organizer?.name ?? 'Unknown'}',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: CommonStyle.gap1Vertical),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.brandPrimaryColor,
                        radius: 10,
                        child: SvgPicture.asset(
                          'assets/icons/Vector.svg',
                          height: 11.h,
                          width: 11.w,
                        ),
                      ),
                      SizedBox(width: CommonStyle.gapBetweenIconsAndText),
                      Text(
                        state
                                    .eventVenueDetails[0]
                                    .event
                                    ?.amount_range
                                    ?.highest_amount !=
                                null
                            ? 'Rs ${state.eventVenueDetails[0].event?.amount_range?.lowest_amount} - Rs ${state.eventVenueDetails[0].event?.amount_range?.highest_amount}'
                            : 'Rs 1000',
                        style: textTheme.bodyMedium!.copyWith(
                          color: AppColors.brandPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: CommonStyle.gap1Vertical),
              Divider(color: AppColors.textSecondaryColor, thickness: 1),
              SizedBox(height: CommonStyle.gap1Vertical),
              Text(
                'Click on Interested to stay updated about this event.',
                maxLines: 2,
                style: textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: CommonStyle.gap1Vertical),
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
                              size: 16.w,
                            ),
                            SizedBox(width: CommonStyle.gapBetweenIconsAndText),
                            Text(
                              (state
                                          .eventVenueDetails[0]
                                          .event
                                          ?.interested_count ??
                                      0)
                                  .toString(),
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
                    flex: 4,
                    child: ElevatedButton(
                      onPressed: () => print('interests'),
                      style: ButtonThemes.elevateButtonStyleforStroke(
                        context,
                        AppColors.buttonlevelSecondaryColor,
                        AppColors.textSecondaryColor,
                      ),
                      child: Text('Interested', style: textTheme.titleSmall),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
