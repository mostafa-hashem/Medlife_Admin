import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/user/ui/screens/users_screen.dart';
import 'package:medlife_v2/features/vendor/ui/screens/vendors_screen.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import '../resources/text_styles.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout();

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  bool isUserSelected = true;
  bool isVendorSelected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 47.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello Ahmed,",
                style: openSans18W500(color: const Color(0xff576A69)),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: const Color(0xfff1f4f6)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = 0;
                            isUserSelected = true;
                            isVendorSelected = false;
                          });
                        },
                        child: Container(
                          color: isUserSelected
                              ? AppColors.primary
                              : Color(0xfff1f4f6),
                          height: 40.h,
                          width: 150.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "User",
                                style: isUserSelected
                                    ? openSans12W600(color: Colors.white)
                                    : openSans12W600(
                                        color: const Color(0xff1E1E1E)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 19.w),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = 1;
                            isVendorSelected = true;
                            isUserSelected = false;
                          });
                        },
                        child: Container(
                          color: isVendorSelected
                              ? AppColors.primary
                              : Color(0xfff1f4f6),
                          height: 40.h,
                          width: 150.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Vendor",
                                style: isVendorSelected
                                    ? openSans12W600(color: Colors.white)
                                    : openSans12W600(
                                        color: const Color(0xff1E1E1E)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              currentIndex == 0 ? UsersScreen() : VendorsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
