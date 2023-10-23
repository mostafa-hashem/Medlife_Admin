import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/user/cubit/user_cubit.dart';
import 'package:medlife_v2/features/user/cubit/user_state.dart';
import 'package:medlife_v2/features/vendor/cubit/vendor_cubit.dart';
import 'package:medlife_v2/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    UserCubit.get(context).getUsers();
    VendorCubit.get(context).getVendors();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (_, state) {
        if (state is GetUserSuccess) {
          Navigator.pushReplacementNamed(context, Routes.layout);
        }
      },
      child: Scaffold(
        body: Center(
          child: Image.asset("assets/images/splsh logo.png"),
        ),
      ),
    );
  }
}
