import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/vendor/data/models/vendor.dart';
import '../../../../ui/resources/text_styles.dart';

class VendorInfo extends StatelessWidget {
  const VendorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final vendor = ModalRoute.of(context)?.settings.arguments as Vendor;
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 17.w,
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 44.w,
                  height: 42.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.76.r),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x23EA6A58),
                        blurRadius: 20,
                        offset: Offset(0, 4.41),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(width: 75.w),
              Text(
                vendor.firstName ?? "",
                style: openSans16W500(color: const Color(0xff576A69)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
