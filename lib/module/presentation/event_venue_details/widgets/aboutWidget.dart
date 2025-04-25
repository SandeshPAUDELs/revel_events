import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:event_app/module/presentation/event_venue_details/cubits/event_venue_detail_cubit.dart';
import 'package:event_app/module/presentation/event_venue_details/cubits/event_venue_details_state.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({super.key});

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
              Text('About Us', style: textTheme.bodySmall),
              ExpandableText(
                backgroundColor: AppColors.buttonlevelSecondaryColor,
                textWidget: Text(
                  state.eventVenueDetails[0].event?.organizer?.description ??
                      '',

                  maxLines: 3,
                  style: textTheme.titleSmall,
                ),
                helper: Helper.text,
                helperTextStyle: textTheme.bodyMedium!.copyWith(
                  color: AppColors.brandPrimaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
