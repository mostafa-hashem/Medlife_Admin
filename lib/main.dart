import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/auth/cubit/auth_cubit.dart';
import 'package:medlife_v2/features/orders/cubit/orders_cubit.dart';
import 'package:medlife_v2/features/user/cubit/user_cubit.dart';
import 'package:medlife_v2/features/vendor/cubit/vendor_cubit.dart';
import 'package:medlife_v2/firebase_options.dart';
import 'package:medlife_v2/route_manager.dart';
import 'package:medlife_v2/utils/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = AppBlocObserver();
  runApp(const MedLifeAdmin());
}

class MedLifeAdmin extends StatelessWidget {
  const MedLifeAdmin();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => AuthCubit()..getAuthStatus(),
            ),
            BlocProvider(
              create: (_) => UserCubit()..getUsers(),
            ),
            BlocProvider(
              create: (_) => VendorCubit()..getVendors(),
            ),
            BlocProvider(
              create: (_) => OrdersCubit(),
            ),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.splash,
            onGenerateRoute: onGenerateRoute,
          ),
        );
      },
    );
  }
}
