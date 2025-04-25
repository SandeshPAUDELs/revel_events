import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:event_app/module/presentation/event_venue_details/cubits/event_venue_detail_cubit.dart';
import 'package:event_app/module/presentation/event_venue_details/cubits/event_venue_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtistsWidget extends StatelessWidget {
  const ArtistsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Artists', style: textTheme.bodySmall),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: BlocBuilder<EventVenueDetailCubit, EventVenueDetailsState>(
            builder: (context, state) {
              if (state is EventVenueDetailsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is EventVenueDetailsError) {
                return Center(child: Text(state.errorMessage));
              } else if (state is EventVenueDetailsLoaded) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.eventVenueDetails[0].event?.artists?.length,
                  itemBuilder: (context, index) {
                    final artist =
                        state.eventVenueDetails[0].event?.artists?[index];

                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(artist?.image ?? ''),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            width: 90,
                            child: Text(
                              artist?.name ?? '',
                              style: textTheme.titleMedium,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
