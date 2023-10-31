import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/vendor/data/models/vendor.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class VendorWidget extends StatelessWidget {
  final Vendor vendor;
  const VendorWidget({super.key, required this.vendor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.account_circle,
                size: 40,
              ),
              SizedBox(
                width: 12.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${vendor.firstName} ${vendor.lastName}",
                    style: openSans16W500(color: const Color(0xff27292D)),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "${vendor.email}",
                    style: openSans12W400(color: Colors.black.withOpacity(0.5)),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15,
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          const Divider(thickness: 1),
        ],
      ),
    );
  }
}
