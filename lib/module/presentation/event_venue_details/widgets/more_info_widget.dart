import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:event_app/module/presentation/event_venue_details/cubits/event_venue_detail_cubit.dart';
import 'package:event_app/module/presentation/event_venue_details/cubits/event_venue_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoreInfoWidget extends StatelessWidget {
  const MoreInfoWidget({super.key});

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
          // print(state.eventVenueDetails[0].event?.metadata_json?.og?.url);
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('More Info', style: textTheme.titleLarge),
              SizedBox(height: CommonStyle.verticalGapBetweenWidgets),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/icons/line.svg'),
                  SizedBox(width: CommonStyle.horizontalGapINMoreInfo),
                  Text(
                    (state.eventVenueDetails[0].event?.event_type?.join(', ') ??
                        'Outdoor'),
                    style: textTheme.titleMedium,
                  ),
                ],
              ),
              SizedBox(height: CommonStyle.verticalGapINMoreInfo),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/icons/Time.svg'),
                  SizedBox(width: CommonStyle.horizontalGapINMoreInfo),
                  Text(
                    state.eventVenueDetails[0].event?.date_range != null
                        ? '${state.eventVenueDetails[0].event!.date_range!['start_datetime']!.substring(19, 27)} - ${state.eventVenueDetails[0].event!.date_range!['end_datetime']!.substring(19, 27)}'
                        : '7:15 PM - 10:15 PM',
                    maxLines: 2,
                    style: textTheme.titleMedium,
                  ),
                ],
              ),
              SizedBox(height: CommonStyle.verticalGapBetweenWidgets),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/icons/Langauge.svg'),
                  SizedBox(width: CommonStyle.horizontalGapINMoreInfo),
                  Text(
                    (state.eventVenueDetails[0].event?.language?.join(', ') ??
                        'Nepali, English'),

                    style: textTheme.titleMedium,
                  ),
                ],
              ),
              SizedBox(height: CommonStyle.verticalGapBetweenWidgets),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/icons/Age aloowed.svg'),
                  SizedBox(width: CommonStyle.horizontalGapINMoreInfo),
                  Text(
                    state.eventVenueDetails[0].event?.age_constraint ??
                        '18 ys +',
                    style: textTheme.titleMedium,
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
