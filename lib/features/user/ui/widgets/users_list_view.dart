import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/user/ui/widgets/user_widget.dart';
import 'package:medlife_v2/route_manager.dart';
import 'package:medlife_v2/features/user/cubit/user_cubit.dart';

class UsersListView extends StatelessWidget {
  const UsersListView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserCubit.get(context).users;
    return Expanded(
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.userInfo,
                  arguments: user[index],),
              child: UserWidget(
                user: user[index],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 15.h,
            );
          },
          itemCount: user.length,),
    );
  }
}
