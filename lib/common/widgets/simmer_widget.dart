import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/common/style/events_container.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class SimmerWidget extends StatelessWidget {
  const SimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _enabled = true;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Color.fromARGB(134, 235, 235, 235),
              highlightColor: Color.fromARGB(113, 185, 185, 185),
              enabled: _enabled,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 234.0.h,
                      width: double.infinity,
                      color: AppColors.textPrimaryColor,
                    ),
                    SizedBox(height: 12.h),
                    Wrap(
                      spacing: CommonStyle.gap1horizontal,
                      children:
                          (['Pop', 'Rok'])
                              .map(
                                (item) => ContainerStyles.createContainer(
                                  context,
                                  item,
                                  AppColors.textPrimaryColor,
                                ),
                              )
                              .toList(),
                    ),
                    SizedBox(height: CommonStyle.gap1Vertical),
                    Wrap(
                      spacing: CommonStyle.gap1horizontal,
                      children:
                          (['Pop', 'Rok'])
                              .map(
                                (item) => ContainerStyles.createContainer(
                                  context,
                                  item,
                                  AppColors.textPrimaryColor,
                                ),
                              )
                              .toList(),
                    ),
                    SizedBox(height: CommonStyle.gap1Vertical),
                    Container(
                      width: double.infinity,
                      height: 12.0.h,
                      color: AppColors.textPrimaryColor,
                    ),
                    SizedBox(height: CommonStyle.gap1Vertical),
                    Container(
                      width: double.infinity,
                      height: 12.0.h,
                      color: AppColors.textPrimaryColor,
                    ),
                    SizedBox(height: CommonStyle.gap1Vertical),
                    Divider(color: AppColors.strokeColor, thickness: 1),
                    SizedBox(height: CommonStyle.gap1Vertical),

                    Container(
                      width: double.infinity,
                      height: 12.0.h,
                      color: AppColors.textPrimaryColor,
                    ),
                    SizedBox(height: CommonStyle.gap1Vertical),
                    Container(
                      width: double.infinity,
                      height: 40.h,
                      color: AppColors.textPrimaryColor,
                    ),
                    SizedBox(height: CommonStyle.gap1Vertical),
                    Container(
                      width: double.infinity,
                      height: 15.h,
                      color: AppColors.textPrimaryColor,
                    ),
                    Divider(color: AppColors.strokeColor, thickness: 1),
                    SizedBox(height: CommonStyle.gap1Vertical),
                    SizedBox(height: CommonStyle.gap1Vertical),
                    Container(
                      height: 450.h,
                      color: AppColors.textPrimaryColor,
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
