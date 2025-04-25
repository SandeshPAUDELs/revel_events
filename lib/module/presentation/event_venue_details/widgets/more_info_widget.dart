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
              Text('More Info', style: textTheme.bodySmall),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/icons/line.svg'),

                  const SizedBox(width: 5),
                  Text(
                    (state.eventVenueDetails[0].event?.event_type?.join(', ') ??
                        'Outdoor'),
                    style: textTheme.titleMedium,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: SvgPicture.asset('assets/icons/Time.svg'),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    flex: 12,
                    child: Text(
                      state.eventVenueDetails[0].event?.date_range != null
                          ? '${state.eventVenueDetails[0].event!.date_range!['start_datetime']} - ${state.eventVenueDetails[0].event!.date_range!['end_datetime']}'
                          : '7:15 PM - 10:15 PM',
                      maxLines: 2,
                      style: textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/icons/Langauge.svg'),
                  const SizedBox(width: 5),
                  Text(
                    (state.eventVenueDetails[0].event?.language?.join(', ') ??
                        'Nepali, English'),

                    style: textTheme.titleMedium,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/icons/Age aloowed.svg'),
                  const SizedBox(width: 5),
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
