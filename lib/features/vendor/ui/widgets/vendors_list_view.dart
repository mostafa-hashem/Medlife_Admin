import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/vendor/cubit/vendor_cubit.dart';
import 'package:medlife_v2/features/vendor/ui/widgets/vendor_widget.dart';
import 'package:medlife_v2/route_manager.dart';

class VendorsListView extends StatelessWidget {
  const VendorsListView();

  @override
  Widget build(BuildContext context) {
    final vendor = VendorCubit.get(context).vendors;
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              Routes.vendorInfo,
              arguments: vendor[index],
            ),
            child: VendorWidget(vendor: vendor[index]),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 15.h,
          );
        },
        itemCount: vendor.length,
      ),
    );
  }
}
