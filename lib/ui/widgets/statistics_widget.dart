import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class StatisticsWidget extends StatelessWidget {
  final String text;
  final String statistics;

  const StatisticsWidget({
    super.key,
    required this.text,
    required this.statistics,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.primary),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: openSans18W500(color: Colors.black),
          ),
          const Spacer(),
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10.r,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(18),
              child: Text(
                statistics,
                style: openSans18W500(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
