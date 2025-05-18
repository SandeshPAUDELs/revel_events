import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArtistsWidget extends StatelessWidget {
  final Widget child;
  const ArtistsWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Artists', style: textTheme.titleLarge),
        SizedBox(height: CommonStyle.verticalGapBetweenWidgets),
        SizedBox(
          height: 150.h,
          child: child,
          
        ),
      ],
    );
  }
}

class ListArtistsContents extends StatelessWidget {
  final String image, name;
  const ListArtistsContents({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(radius: 47.r, backgroundImage: NetworkImage(image)),
        SizedBox(height: CommonStyle.gapBetweenIconsAndText),
        SizedBox(
          width: 120.w,
          child: Text(
            name,
            // artist?.name ?? '',
            style: textTheme.titleSmall,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
