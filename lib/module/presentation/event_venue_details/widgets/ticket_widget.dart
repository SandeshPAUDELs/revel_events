import 'package:event_app/common/style/cards_styles.dart';
import 'package:event_app/module/presentation/cubit/expandable_card_cubit.dart';
import 'package:event_app/module/presentation/event_venue_details/cubits/event_venue_detail_cubit.dart';
import 'package:event_app/module/presentation/event_venue_details/cubits/event_venue_details_state.dart';
import 'package:event_app/module/presentation/event_venue_details/widgets/expanded_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<EventVenueDetailCubit, EventVenueDetailsState>(
          builder: (context, state) {
            if (state is EventVenueDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is EventVenueDetailsError) {
              return Center(child: Text(state.errorMessage));
            } else if (state is EventVenueDetailsLoaded) {
              final venueList = state.eventVenueDetails;
              final expandCubit = context.read<ExpandCubit>();
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (expandCubit.state.length != venueList.length) {
                  expandCubit.initializeList(venueList.length);
                }
              });

              return BlocBuilder<ExpandCubit, List<bool>>(
                builder: (context, isExpandedList) {
                  return ListView.builder(
                    itemCount: venueList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final venue = venueList[index].venue;
                      return Column(
                        children: [
                          CardThemees.venueCard(
                            context,
                            state.eventVenueDetails[0].start_datetime ?? '',
                            state.eventVenueDetails[0].start_datetime ?? '',
                            state.eventVenueDetails[0].start_datetime ?? '',
                            state.eventVenueDetails[0].event?.date_range != null
                                ? '${state.eventVenueDetails[0].event!.date_range!['start_datetime']!.substring(19, 27)} - ${state.eventVenueDetails[0].event!.date_range!['end_datetime']!.substring(19, 27)}'
                                : '7:15 PM - 10:15 PM',
                            venue?.address ?? '',
                            SvgPicture.asset('assets/icons/Time.svg'),
                            SvgPicture.asset(
                              'assets/icons/pinched location.svg',
                            ),
                            SvgPicture.asset('assets/icons/Amp.svg'),
                            Image.asset('assets/images/Vector.png'),

                            () {
                              if (index < isExpandedList.length) {
                                expandCubit.toggleExpand(index);
                              }
                            },
                            () async {
                              final url = venue?.google_map_url;
                              if (url != null &&
                                  Uri.tryParse(url)?.hasAbsolutePath == true) {
                                final parsedUrl = Uri.parse(url);
                                if (!await launchUrl(
                                  parsedUrl,
                                  mode: LaunchMode.inAppWebView,
                                )) {
                                  throw Exception(
                                    'Could not launch $parsedUrl',
                                  );
                                }
                              } else {
                                throw ArgumentError(
                                  'Invalid or missing URL: $url',
                                );
                              }
                            },
                          ),
                          if (index < isExpandedList.length &&
                              isExpandedList[index])
                            const ExpandedWidget(),
                        ],
                      );
                    },
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
