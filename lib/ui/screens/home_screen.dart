import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/orders/cubit/orders_cubit.dart';
import 'package:medlife_v2/features/orders/cubit/orders_state.dart';
import 'package:medlife_v2/features/orders/ui/screens/orders.dart';
import 'package:medlife_v2/features/user/ui/screens/users_screen.dart';
import 'package:medlife_v2/features/vendor/ui/screens/vendors_screen.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';

import '../resources/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    OrdersCubit.get(context).getOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {
        if (state is GetOrdersSuccess) {
          OrdersCubit.get(context).getAcceptedOrder();
          OrdersCubit.get(context).getPendingOrders();
          OrdersCubit.get(context).getDeliveredOrders();
        }
      },
      builder: (context, state) => SafeArea(
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
                    padding:
                        EdgeInsets.symmetric(vertical: 7.h, horizontal: 8.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              currentIndex = 0;
                            });
                          },
                          child: Container(
                            color: currentIndex == 0
                                ? AppColors.primary
                                : Color(0xfff1f4f6),
                            height: 40.h,
                            width: 90.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "User",
                                  style: currentIndex == 0
                                      ? openSans12W600(color: Colors.white)
                                      : openSans12W600(
                                          color: const Color(0xff1E1E1E)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              currentIndex = 1;
                            });
                          },
                          child: Container(
                            color: currentIndex == 1
                                ? AppColors.primary
                                : Color(0xfff1f4f6),
                            height: 40.h,
                            width: 90.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Vendor",
                                  style: currentIndex == 1
                                      ? openSans12W600(color: Colors.white)
                                      : openSans12W600(
                                          color: const Color(0xff1E1E1E)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              currentIndex = 2;
                            });
                          },
                          child: Container(
                            color: currentIndex == 2
                                ? AppColors.primary
                                : Color(0xfff1f4f6),
                            height: 40.h,
                            width: 90.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Orders",
                                  style: currentIndex == 2
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
                currentIndex == 0
                    ? UsersScreen()
                    : currentIndex == 1
                        ? VendorsScreen()
                        : Orders(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
