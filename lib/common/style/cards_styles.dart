import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        BorderRadius,
        BuildContext,
        Card,
        CircleAvatar,
        EdgeInsets,
        Padding,
        RoundedRectangleBorder,
        Text,
        TextButton,
        VoidCallback,
        Widget;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardThemees {
  static Card createEmptyCard(BuildContext context, Widget child) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CommonStyle.borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        child: child,
      ),
    );
  }

  static Card venueCard(
    BuildContext context,
    String day,
    String date,
    String monthYear,
    String dateTime,
    String location,
    SvgPicture dateTimeIcon,
    SvgPicture locationIcon,
    SvgPicture icon,
    Image actionIcon,
    VoidCallback onTap,
    VoidCallback onPressed,
  ) {
    final textTheme = TextThemes.createTextTheme(context);
    return Card(
      elevation: 3,
      color: AppColors.cardBackgroundColor,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(CommonStyle.borderRadius),
      // ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment(0, 0),
                  image: AssetImage('assets/images/Subtract.png'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0.r),
                  bottomLeft: Radius.circular(10.0.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(day.substring(0, 3), style: textTheme.titleSmall),
                    // SizedBox(height: 6.h),
                    Text(date.substring(5, 7), style: textTheme.headlineMedium),
                    // SizedBox(height: 6.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          monthYear.substring(8, 16),
                          style: textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.only(top: 10.h, left: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      dateTimeIcon,
                      SizedBox(width: CommonStyle.horizontalGapBtwnRows),
                      Text(dateTime, style: textTheme.titleMedium),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      locationIcon,
                      SizedBox(width: CommonStyle.horizontalGapBtwnRows),
                      Text(location, style: textTheme.titleMedium),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          icon,
                          TextButton(
                            onPressed: onPressed,
                            child: Text('Map', style: textTheme.titleMedium),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 15.r,
                        backgroundColor: AppColors.textPrimaryColor,
                        child: GestureDetector(
                          onTap: onTap,
                          child: Image.asset(
                            'assets/images/Vector.png',
                            width: 15.w,
                            height: 15.h,
                          ),
                        ),
                      ),
                      //  CircleAvatar(
                      //         backgroundColor: Colors.black54,
                      //         child: Icon(
                      //           Icons.favorite_border,
                      //           color: Colors.white,
                      //           size: 20.h,
                      //         ),
                      //       ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
