import 'package:event_app/common/style/bottom_sheet.dart';
import 'package:event_app/common/style/cards_styles.dart';
import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:event_app/module/presentation/cubit/expandable_card_cubit.dart';
import 'package:event_app/module/presentation/event_venue_details/cubits/event_venue_detail_cubit.dart';
import 'package:event_app/module/presentation/event_venue_details/cubits/event_venue_details_state.dart';
import 'package:event_app/module/presentation/event_venue_details/widgets/expanded_widget.dart';
import 'package:event_app/module/presentation/event_venue_details/widgets/filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);

    return Column(
      children: [
        SizedBox(height: CommonStyle.verticalGapBetweenWidgets),
        Row(
          children: [
            Expanded(
              flex: 6,
              child: Text('Select Venues', style: textTheme.titleMedium),
            ),
            Expanded(
              child: SizedBox(
                height: 30.h,
                width: 30.w,
                child: ElevatedButton(
                  onPressed: () {
                    BottomSheetStyle.showModalsBottomSheet(
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
                  child: SvgPicture.asset(
                    'assets/icons/filter.svg',
                    height: 20.h,
                    width: 20.h,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: CommonStyle.verticalGapBetweenWidgets),
        Stack(
          alignment: Alignment.center,
          children: [
            Divider(color: AppColors.strokeColor, thickness: 1),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: CommonStyle.screenPadding,
              ),
              decoration: BoxDecoration(
                color: AppColors.buttonlevelSecondaryColor,
              ),
              child: Text('Pokhara', style: textTheme.titleSmall),
            ),
          ],
        ),
        SizedBox(height: CommonStyle.verticalGapBetweenWidgets),
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
                            venue?.name ?? '',
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
