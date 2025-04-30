import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/core/config/routes/routes_name.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RecommendedEventWidget extends StatelessWidget {
  const RecommendedEventWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);
    final recommendedEvents = [
      {
        'name': 'Sajan Raj Vaidya World Tour',
        'location': 'Lakeside-06, Pokhara',
        'date': 'August 4, 2024 - August 10, 2024',
        'organizer': 'REVEL',
        'price': 'Rs.10,000 - Rs.50,000',
        'image':
            'https://plus.unsplash.com/premium_photo-1668430856694-62c7753fb03b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw1fHx8ZW58MHx8fHx8',
        'routes': RoutesName.eventScreeen,
      },
      {
        'name': 'Sajan Raj Vaidya World Tour',
        'location': 'Lakeside-06, Pokhara',
        'date': 'August 4, 2024 - August 10, 2024',
        'organizer': 'REVEL',
        'price': 'Rs.10,000 - Rs.50,000',
        'image':
            'https://plus.unsplash.com/premium_photo-1668430856694-62c7753fb03b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw1fHx8ZW58MHx8fHx8',
        'routes': RoutesName.eventScreeen,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recommended Events', style: textTheme.titleLarge),
        SizedBox(height: CommonStyle.verticalGapBetweenWidgets),
        SizedBox(
          height: 320.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: recommendedEvents.length,
            separatorBuilder: (context, index) => SizedBox(width: 12.w),
            itemBuilder: (context, index) {
              final event = recommendedEvents[index];
              return GestureDetector(
                onTap: () {
                  context.push('${event['routes']}');
                },
                child: Container(
                  width: 260.w,
                  height: 320.h,
                  decoration: BoxDecoration(
                    color: AppColors.cardBackgroundColor,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: AppColors.strokeColor, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16.r),
                            ),
                            child: Image.network(
                              event['image']!,
                              width: double.infinity,
                              height: 160.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 12.h,
                            right: 12.h,
                            child: CircleAvatar(
                              radius: 15.r,
                              backgroundColor: AppColors.cardBackgroundColor,
                              child: Icon(
                                Icons.favorite_border,
                                color: AppColors.textPrimaryColor,
                                size: 20.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          // bottom: 12.h,
                          bottom: 0.h,
                          left: CommonStyle.screenPadding,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: CommonStyle.horizontalGap),
                            Text(
                              event['name']!,
                              style: textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                height: 1.5.h,
                              ),
                            ),
                            SizedBox(height: CommonStyle.horizontalGapBtwnRows),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppColors.textPrimaryColor,
                                  size: 14.w,
                                ),
                                SizedBox(
                                  width: CommonStyle.gapBetweenIconsAndText,
                                ),
                                Text(
                                  event['location']!,
                                  style: textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            SizedBox(height: CommonStyle.horizontalGapBtwnRows),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  color: AppColors.textPrimaryColor,
                                  size: 14.h,
                                ),
                                SizedBox(
                                  width: CommonStyle.gapBetweenIconsAndText,
                                ),
                                Text(
                                  event['date']!,
                                  style: textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            SizedBox(height: CommonStyle.horizontalGapBtwnRows),
                            Row(
                              children: [
                                Text(
                                  event['organizer']!,
                                  style: textTheme.bodyMedium,
                                ),
                                SizedBox(
                                  width: CommonStyle.gapBetweenIconsAndText,
                                ),
                                Text(
                                  'Organized by ${event['organizer']!}',
                                  style: textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            SizedBox(height: CommonStyle.horizontalGapBtwnRows),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppColors.brandPrimaryColor,
                                  radius: 10.r,
                                  child: Icon(
                                    Icons.currency_rupee_sharp,
                                    color: AppColors.textPrimaryColor,
                                    size: 11.h,
                                  ),
                                ),
                                SizedBox(
                                  width: CommonStyle.gapBetweenIconsAndText,
                                ),
                                Text(
                                  event['price']!,
                                  style: textTheme.bodyMedium!.copyWith(
                                    color: AppColors.brandPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
