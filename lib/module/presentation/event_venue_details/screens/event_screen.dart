import 'package:event_app/common/style/bottom_sheet.dart';
import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/common/style/events_container.dart';
import 'package:event_app/common/widgets/persistent_headers.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:event_app/module/presentation/event_venue_details/cubits/event_venue_detail_cubit.dart';
import 'package:event_app/module/presentation/event_venue_details/cubits/event_venue_details_state.dart';
import 'package:event_app/module/presentation/event_venue_details/widgets/aboutWidget.dart';
import 'package:event_app/module/presentation/event_venue_details/widgets/artist_widget.dart';
import 'package:event_app/module/presentation/event_venue_details/widgets/botton_nav_widget.dart';
import 'package:event_app/module/presentation/event_venue_details/widgets/describe_events.dart';
import 'package:event_app/module/presentation/event_venue_details/widgets/filter_widget.dart';
import 'package:event_app/module/presentation/event_venue_details/widgets/galleries_widget.dart';
import 'package:event_app/module/presentation/event_venue_details/widgets/more_info_widget.dart';
import 'package:event_app/module/presentation/event_venue_details/widgets/organizer_widget.dart';
import 'package:event_app/module/presentation/event_venue_details/widgets/recommended_events.dart';
import 'package:event_app/module/presentation/event_venue_details/widgets/terms_conditions_widget.dart';
import 'package:event_app/module/presentation/event_venue_details/widgets/ticket_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EventScreen extends StatelessWidget {
  final GlobalKey ticketKey = GlobalKey();
  final GlobalKey moreInfoKey = GlobalKey();
  final GlobalKey artistKey = GlobalKey();
  final GlobalKey aboutUsKey = GlobalKey();
  final GlobalKey galleryKey = GlobalKey();
  final GlobalKey videoKey = GlobalKey();
  final GlobalKey termsAndConditionkey = GlobalKey();
  final GlobalKey meetOrganizerkey = GlobalKey();
  final GlobalKey recommendedEventKey = GlobalKey();

  final ScrollController scrollController = ScrollController();

  EventScreen({super.key});

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EventVenueDetailCubit>().getEventVenueDetails();
    });
    final textTheme = TextThemes.createTextTheme(context);
    final keys = [
      ticketKey,
      moreInfoKey,
      artistKey,
      aboutUsKey,
      galleryKey,
      videoKey,
      termsAndConditionkey,
      meetOrganizerkey,
      recommendedEventKey,
    ];

    return Scaffold(
      backgroundColor: AppColors.buttonlevelSecondaryColor,
      body: DefaultTabController(
        length: 9,
        child: BlocBuilder<EventVenueDetailCubit, EventVenueDetailsState>(
          builder: (context, state) {
            if (state is EventVenueDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is EventVenueDetailsLoaded) {
              return NestedScrollView(
                controller: scrollController,
                headerSliverBuilder: (
                  BuildContext context,
                  bool innerBoxIsScrolled,
                ) {
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: 234.0.h,
                      floating: false,
                      backgroundColor: AppColors.buttonlevelSecondaryColor,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        titlePadding: EdgeInsetsDirectional.only(
                          start: 40.w,
                          bottom: 16.h,
                        ),
                        title: Text(
                          state.eventVenueDetails[0].event?.name ??
                              'Event Name',
                          style: textTheme.titleLarge,
                        ),
                        background: Image.network(
                          state.eventVenueDetails[0].image ??
                              'https://via.placeholder.com/150',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Text(
                                'Error loading image',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: AppColors.textPrimaryColor,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      leading: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColors.textPrimaryColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      actions: [
                        IconButton(
                          icon: Icon(
                            Icons.share,
                            color: AppColors.textPrimaryColor,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.more_vert,
                            color: AppColors.textPrimaryColor,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),

                        child: DesccribeEvents(
                          venue: state.eventVenueDetails[0].venue?.name ?? '',
                          dateTime: '${state.eventVenueDetails[0].event!.date_range!['start_datetime']?.substring(0, 16)} - ${state.eventVenueDetails[0].event!.date_range!['end_datetime']?.substring(0, 16)}',
                          organizer: state.eventVenueDetails[0].event?.organizer?.name ?? '',
                          organizerimage: state.eventVenueDetails[0].event?.organizer?.image ??
                              '',
                          price: state
                                    .eventVenueDetails[0]
                                    .event
                                    ?.amount_range
                                    ?.highest_amount !=
                                null
                            ? 'Rs ${state.eventVenueDetails[0].event?.amount_range?.lowest_amount} - Rs ${state.eventVenueDetails[0].event?.amount_range?.highest_amount}'
                            : 'Rs 1000',
                          interestedCount: state
                                          .eventVenueDetails[0]
                                          .event
                                          ?.interested_count ??
                                      0,
                          children1: Wrap(
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
                          children2: Wrap(
                            spacing: CommonStyle.gap1horizontal,
                            children:
                                (state
                                            .eventVenueDetails[0]
                                            .event
                                            ?.subcategory ??
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
                        ),
                      ),
                    ),

                    SliverPersistentHeader(
                      delegate: SliverAppBarDelegate(
                        TabBar(
                          isScrollable: true,
                          labelStyle: textTheme.titleMedium,
                          labelColor: AppColors.textPrimaryColor,
                          unselectedLabelColor: AppColors.textSecondaryColor,
                          indicatorColor: AppColors.brandPrimaryColor,
                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                              color: AppColors.brandPrimaryColor,
                              width: 2.0,
                            ),
                            insets: EdgeInsets.fromLTRB(-10.0, 0, 0, 0),
                          ),
                          tabAlignment: TabAlignment.start,
                          tabs: [
                            Tab(child: Text('Ticket')),
                            Tab(child: Text('More Info')),
                            Tab(child: Text('Artists')),
                            Tab(child: Text('About')),
                            Tab(child: Text('Gallery')),
                            Tab(child: Text('Video')),
                            Tab(child: Text('Terms and Condition')),
                            Tab(child: Text('Meet Organizer')),
                            Tab(child: Text('Recommended Events')),
                          ],
                          onTap: (index) {
                            scrollToSection(keys[index]);
                          },
                        ),
                      ),
                      pinned: true,
                    ),
                  ];
                },
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(height: CommonStyle.verticalGapBetweenWidgets),
                        Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: Text(
                                'Select Venues',
                                style: textTheme.titleMedium,
                              ),
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
                                    backgroundColor:
                                        AppColors.cardBackgroundColor,
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
                              child: Text(
                                'Pokhara',
                                style: textTheme.titleSmall,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          key: ticketKey,
                          alignment: Alignment.center,
                          child: TicketWidget(),
                        ),
                        Divider(color: AppColors.strokeColor, thickness: 2),
                        SizedBox(height: CommonStyle.verticalGapBetweenWidgets),

                        Container(
                          key: moreInfoKey,
                          alignment: Alignment.center,
                          child: MoreInfoWidget(
                            eventType:
                                (state.eventVenueDetails[0].event?.event_type
                                        ?.join(', ') ??
                                    'Outdoor'),
                            datetime:
                                state.eventVenueDetails[0].event?.date_range !=
                                        null
                                    ? '${state.eventVenueDetails[0].event!.date_range!['start_datetime']!.substring(19, 27)} - ${state.eventVenueDetails[0].event!.date_range!['end_datetime']!.substring(19, 27)}'
                                    : '7:15 PM - 10:15 PM',
                            ageConstraint:
                                state
                                    .eventVenueDetails[0]
                                    .event
                                    ?.age_constraint ??
                                '18 ys +',
                            language:
                                (state.eventVenueDetails[0].event?.language
                                        ?.join(', ') ??
                                    'Nepali, English'),
                          ),
                        ),
                        Divider(color: AppColors.strokeColor, thickness: 2),
                        SizedBox(height: CommonStyle.verticalGapBetweenWidgets),

                        Container(
                          key: artistKey,
                          alignment: Alignment.center,
                          child: ArtistsWidget(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  state
                                      .eventVenueDetails[0]
                                      .event
                                      ?.artists
                                      ?.length,
                              itemBuilder: (context, index) {
                                final artist =
                                    state
                                        .eventVenueDetails[0]
                                        .event
                                        ?.artists?[index];
                                return ListArtistsContents(
                                  image: artist?.image ?? '',
                                  name: artist?.name ?? '',
                                );
                              },
                            ),
                          ),
                        ),
                        Divider(color: AppColors.strokeColor, thickness: 2),
                        SizedBox(height: CommonStyle.verticalGapBetweenWidgets),

                        Container(
                          key: aboutUsKey,
                          alignment: Alignment.center,
                          child: AboutUsWidget(
                            aboutUs:
                                state
                                    .eventVenueDetails[0]
                                    .event
                                    ?.organizer
                                    ?.description ??
                                '',
                          ),
                        ),

                        Divider(color: AppColors.strokeColor, thickness: 2),
                        SizedBox(height: CommonStyle.verticalGapBetweenWidgets),

                        Container(
                          key: galleryKey,
                          alignment: Alignment.center,
                          child: Gallery(),
                        ),
                        Divider(color: AppColors.strokeColor, thickness: 2),
                        SizedBox(height: CommonStyle.verticalGapBetweenWidgets),
                        Container(
                          key: videoKey,
                          alignment: Alignment.center,
                          child: Gallery(),
                        ),
                        Divider(color: AppColors.strokeColor, thickness: 2),
                        SizedBox(height: CommonStyle.verticalGapBetweenWidgets),

                        Container(
                          key: termsAndConditionkey,
                          alignment: Alignment.center,
                          child: TermsAndConditions(
                            termsAndConditions:
                                state
                                    .eventVenueDetails[0]
                                    .terms_and_condition ??
                                "Terms and Conditions Cannot be loaded",
                          ),
                        ),
                        Divider(color: AppColors.strokeColor, thickness: 2),
                        SizedBox(height: CommonStyle.verticalGapBetweenWidgets),

                        Container(
                          key: meetOrganizerkey,
                          alignment: Alignment.center,
                          child: OrganizerWidget(
                            title:
                                state
                                    .eventVenueDetails[0]
                                    .event
                                    ?.organizer
                                    ?.name ??
                                'Organizer Name',
                            organizer:
                                state
                                    .eventVenueDetails[0]
                                    .event
                                    ?.organizer
                                    ?.name ??
                                'Organizer',
                            followers:
                                '${state.eventVenueDetails[0].event?.organizer?.totalFollowersCount ?? 0} Followers',
                            image: NetworkImage(
                              state
                                      .eventVenueDetails[0]
                                      .event
                                      ?.organizer
                                      ?.image ??
                                  'https://plus.unsplash.com/premium_photo-1668430856694-62c7753fb03b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw1fHx8ZW58MHx8fHx8',
                            ),
                          ),
                        ),
                        SizedBox(height: CommonStyle.verticalGapBetweenWidgets),

                        Divider(color: AppColors.strokeColor, thickness: 2),
                        SizedBox(height: CommonStyle.verticalGapBetweenWidgets),

                        Container(
                          key: recommendedEventKey,
                          alignment: Alignment.center,
                          child: RecommendedEventWidget(),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is EventVenueDetailsError) {
              return const Center(
                child: Text('Error loading organizer details'),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      bottomNavigationBar: const BottonNavWidget(),
    );
  }
}
