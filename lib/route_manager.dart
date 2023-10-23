import 'package:flutter/material.dart';
import 'package:medlife_v2/features/auth/ui/screens/login_screen.dart';
import 'package:medlife_v2/features/user/ui/screens/user_info.dart';
import 'package:medlife_v2/features/vendor/ui/screens/vendor_info.dart';
import 'package:medlife_v2/ui/screens/home_layout.dart';
import 'package:medlife_v2/ui/screens/splash_screen.dart';

class Routes {
  static const String layout = "/layout";
  static const String splash = "/splashScreen";
  static const String login = "/login";
  static const String userInfo = "/userInfo";
  static const String vendorInfo = "/vendorInfo";
}

Route? onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Routes.layout:
      return MaterialPageRoute(
        builder: (_) => const HomeLayout(),
      );
    case Routes.splash:
      return MaterialPageRoute(
        builder: (_) => const SplashScreen(),
      );
    case Routes.login:
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      );
    case Routes.userInfo:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const UserInfo(),
      );
    case Routes.vendorInfo:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const VendorInfo(),
      );
    default:
      return null;
  }
}
