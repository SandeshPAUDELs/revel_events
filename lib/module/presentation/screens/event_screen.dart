import 'package:event_app/common/widgets/persistent_headers.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:event_app/module/presentation/widgets/aboutWidget.dart';
import 'package:event_app/module/presentation/widgets/artist_widget.dart';
import 'package:event_app/module/presentation/widgets/botton_nav_widget.dart';
import 'package:event_app/module/presentation/widgets/describe_events.dart';
import 'package:event_app/module/presentation/widgets/galleries_widget.dart';
import 'package:event_app/module/presentation/widgets/more_info_widget.dart';
import 'package:event_app/module/presentation/widgets/organizer_widget.dart';
import 'package:event_app/module/presentation/widgets/recommended_events.dart';
import 'package:event_app/module/presentation/widgets/terms_conditions_widget.dart';
import 'package:event_app/module/presentation/widgets/ticket_widget.dart';
import 'package:flutter/material.dart';

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
    final textTheme = TextThemes.createTextTheme(context);
    final title = [
      {'test': 'Sajan Raj Vaidya World Tour'},
    ];
    return Scaffold(
      backgroundColor: AppColors.buttonlevelSecondaryColor,
      body: DefaultTabController(
        length: 9,
        child: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                backgroundColor: AppColors.buttonlevelSecondaryColor,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsetsDirectional.only(
                    start: 40,
                    bottom: 16,
                  ),
                  title: Text(title[0]['test']!, style: textTheme.titleLarge),
                  background: Image.network(
                    "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                    fit: BoxFit.cover,
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
                    icon: Icon(Icons.share, color: AppColors.textPrimaryColor),
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
                 
                  child: DesccribeEvents(),
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
                      if (index == 0) {
                        scrollToSection(ticketKey);
                      } else if (index == 1) {
                        scrollToSection(moreInfoKey);
                      } else if (index == 2) {
                        scrollToSection(artistKey);
                      } else if (index == 3) {
                        scrollToSection(aboutUsKey);
                      } else if (index == 4) {
                        scrollToSection(galleryKey);
                      } else if (index == 5) {
                        scrollToSection(videoKey);
                      } else if (index == 6) {
                        scrollToSection(termsAndConditionkey);
                      } else if (index == 7) {
                        scrollToSection(meetOrganizerkey);
                      } else if (index == 8) {
                        scrollToSection(recommendedEventKey);
                      }
                    },
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  key: ticketKey,
                  alignment: Alignment.center,
                  child: TicketWidget(),
                ),
                Divider(color: AppColors.strokeColor, thickness: 2),

                Container(
                  key: moreInfoKey,
                  alignment: Alignment.center,
                  child: MoreInfoWidget(),
                ),
                Divider(color: AppColors.strokeColor, thickness: 2),

                Container(
                  key: artistKey,
                  alignment: Alignment.center,
                  child: ArtistsWidget(),
                ),
                Divider(color: AppColors.strokeColor, thickness: 2),
                Container(
                  key: aboutUsKey,
                  alignment: Alignment.center,
                  child: AboutUsWidget(),
                ),

                Divider(color: AppColors.strokeColor, thickness: 2),
                Container(
                  key: galleryKey,
                  alignment: Alignment.center,
                  child: GalleriesWidget(),
                ),
                Divider(color: AppColors.strokeColor, thickness: 2),
                Container(
                  key: videoKey,
                  alignment: Alignment.center,
                  child: GalleriesWidget(),
                ),
                Divider(color: AppColors.strokeColor, thickness: 2),
                Container(
                  key: termsAndConditionkey,
                  alignment: Alignment.center,
                  child: TermsAndConditions(),
                ),
                Divider(color: AppColors.strokeColor, thickness: 2),
                Container(
                  key: meetOrganizerkey,
                  alignment: Alignment.center,
                  child: OrganizerWidget(
                    title: 'Organizer Name',
                    organizer: 'Organizer',
                    followers: '150 Followers',
                    image: NetworkImage(
                      'https://plus.unsplash.com/premium_photo-1668430856694-62c7753fb03b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw1fHx8ZW58MHx8fHx8',
                    ),
                  ),
                ),
                Divider(color: AppColors.strokeColor, thickness: 2),
                Container(
                  key: recommendedEventKey,
                  alignment: Alignment.center,
                  child: RecommendedEventWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottonNavWidget(),
    );
  }
}
