import 'package:event_app/common/style/button_styles.dart';
import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/common/style/events_container.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:event_app/module/presentation/event_venue_details/cubits/event_venue_detail_cubit.dart';
import 'package:event_app/module/presentation/event_venue_details/cubits/event_venue_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                    spacing: CommonStyle.contanersPadding,
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
              const SizedBox(height: 10),
              Row(
                children: [
                  Wrap(
                    spacing: CommonStyle.contanersPadding,
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
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/pinched location.svg',
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        state.eventVenueDetails[0].venue?.name ??
                            'Unknown Venue',
                        style: textTheme.titleSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Calender.svg',
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            '${state.eventVenueDetails[0].event!.date_range!['start_datetime']} - ${state.eventVenueDetails[0].event!.date_range!['end_datetime']}',
                            style: textTheme.titleSmall,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        child: Image.network(
                          state.eventVenueDetails[0].event?.organizer?.image ??
                              '',
                        ),
                      ),

                      const SizedBox(width: 4),
                      Text(
                        'Organized by ${state.eventVenueDetails[0].event?.organizer?.name ?? 'Unknown'}',
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
                        child: SvgPicture.asset(
                          'assets/icons/Vector.svg',
                          height: 11,
                          width: 11,
                        ),
                      ),
                      const SizedBox(width: 4),
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
              const SizedBox(height: 10),
              Divider(color: AppColors.textSecondaryColor, thickness: 1),
              const SizedBox(height: 10),
              Text(
                'Click on Interested to stay updated about this event.',
                maxLines: 2,
                style: textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
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
        return const SizedBox.shrink();
      },
    );
  }
}
