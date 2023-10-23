import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import '../../../../ui/resources/text_styles.dart';
import '../../data/models/user.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as User;
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
                    "User",
                    style: openSans16W500(color: const Color(0xff576A69)),
                  ),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              Row(
                children: [
                  Icon(
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
                        "${user.firstName} ${user.lastName}",
                        style: openSans16W500(color: Color(0xff27292D)),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "${user.email}",
                        style: openSans12W400(
                            color: Colors.black.withOpacity(0.5)),
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
                    color: AppColors.primary),
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
                    animType: AnimType.scale,
                    btnOkColor: AppColors.primary,
                    title: 'Block user',
                    desc: 'Do You want to block this user ?',
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {

                    },
                  )..show();
                },
                child: Row(
                  children: [
                    Text(
                      "Block User",
                      style: openSans16W400(color: Colors.black),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                    )
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
