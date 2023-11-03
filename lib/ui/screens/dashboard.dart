import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/orders/cubit/orders_cubit.dart';
import 'package:medlife_v2/features/user/cubit/user_cubit.dart';
import 'package:medlife_v2/features/vendor/cubit/vendor_cubit.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/statistics_widget.dart';

class Dashboard extends StatelessWidget {
  const Dashboard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 20.w),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Dashboard",
              style: openSans24W600(color: AppColors.primary),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          StatisticsWidget(
            text: 'Users',
            statistics: UserCubit.get(context).users.length.toString(),
          ),
          SizedBox(
            height: 32.h,
          ),
          StatisticsWidget(
            text: 'Vendors',
            statistics: VendorCubit.get(context).vendors.length.toString(),
          ),
          SizedBox(
            height: 32.h,
          ),
          StatisticsWidget(
            text: 'Orders',
            statistics: OrdersCubit.get(context).allOrders.length.toString(),
          ),
          SizedBox(
            height: 60.h,
          ),
          Text(
            "Most vendor has orders",
            style: openSans20W600(color: AppColors.primary),
          ),
          SizedBox(
            height: 22.h,
          ),
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
                VendorCubit.get(context).mostOrdersVendor.email!,
                style: openSans18W500(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
