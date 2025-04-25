import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:event_app/module/presentation/event_venue_details/cubits/event_venue_detail_cubit.dart';
import 'package:event_app/module/presentation/event_venue_details/cubits/event_venue_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);
    return BlocBuilder<EventVenueDetailCubit, EventVenueDetailsState>(
      builder: (context, state) {
        if (state is EventVenueDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is EventVenueDetailsLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Terms and Conditions', style: textTheme.bodySmall),
              const SizedBox(height: 10),
              Html(
                data:
                    state.eventVenueDetails[0].terms_and_condition ??
                    "Terms and Conditions Cannot be loaded",
                
                style: {"p": Style(color: AppColors.textPrimaryColor)},
              ),
            ],
          );
        } else if (state is EventVenueDetailsError) {
          return const Center(child: Text('Error loading organizer details'));
        } else {
          return Container();
        }
      },
    );
  }
}