import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/vendor/data/models/vendor.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class VendorInfo extends StatelessWidget {
  const VendorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final vendor = ModalRoute.of(context)!.settings.arguments! as Vendor;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.h,
              ),
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
                  SizedBox(width: 140.w),
                  Text(
                    "Vendor",
                    style: openSans16W500(color: const Color(0xff576A69)),
                  ),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.account_circle,
                    size: 45,
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
                        style: openSans12W400(
                            color: Colors.black.withOpacity(0.5),),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: AppColors.primary,),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  child: Text(
                    "Account management",
                    style: openSans16W500(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              GestureDetector(
                onTap: () {
                  AwesomeDialog(
                    dismissOnTouchOutside: false,
                    context: context,
                    dialogType: DialogType.question,
                    btnOkColor: AppColors.primary,
                    title: 'Block user',
                    desc: 'Do You want to block this user ?',
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {},
                  ).show();
                },
                child: Row(
                  children: [
                    Text(
                      "Block User",
                      style: openSans16W400(color: Colors.black),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
