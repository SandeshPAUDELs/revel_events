import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GalleriesWidget extends StatelessWidget {
  const GalleriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Galleries', style: textTheme.titleLarge),
        SizedBox(height: CommonStyle.verticalGapBetweenWidgets),
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
          child: Image.network(
            'https://plus.unsplash.com/premium_photo-1668430856694-62c7753fb03b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw1fHx8ZW58MHx8fHx8',
            width: double.infinity,
            height: 225.h,
            fit: BoxFit.cover,
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 2,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network(
                'https://plus.unsplash.com/premium_photo-1668430856694-62c7753fb03b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw1fHx8ZW58MHx8fHx8',
                width: double.infinity,
                height: 110.h,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
        SizedBox(height: CommonStyle.horizontalGap),
      ],
    );
  }
}
