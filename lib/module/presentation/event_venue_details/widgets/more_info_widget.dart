import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoreInfoWidget extends StatelessWidget {
  final String eventType, datetime, ageConstraint, language;
  const MoreInfoWidget({
    super.key,
    required this.eventType,
    required this.datetime,
    required this.ageConstraint,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);
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
            Text(eventType, style: textTheme.titleMedium),
          ],
        ),
        SizedBox(height: CommonStyle.verticalGapINMoreInfo),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/icons/Time.svg'),
            SizedBox(width: CommonStyle.horizontalGapINMoreInfo),
            Text(datetime, maxLines: 2, style: textTheme.titleMedium),
          ],
        ),
        SizedBox(height: CommonStyle.verticalGapINMoreInfo),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/icons/Langauge.svg'),
            SizedBox(width: CommonStyle.horizontalGapINMoreInfo),
            Text(language, style: textTheme.titleMedium),
          ],
        ),
        SizedBox(height: CommonStyle.verticalGapINMoreInfo),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/icons/Age aloowed.svg'),
            SizedBox(width: CommonStyle.horizontalGapINMoreInfo),
            Text(ageConstraint, style: textTheme.titleMedium),
          ],
        ),
        SizedBox(height: CommonStyle.verticalGapBetweenWidgets),
      ],
    );
  }
}
