import 'package:flutter/material.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/screens/dashboard.dart';
import 'package:medlife_v2/ui/screens/home_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout();

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const Dashboard(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: AppColors.primary,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: currentIndex == 0
                  ? const Icon(
                      Icons.home,
                      color: Colors.white,
                    )
                  : const Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: currentIndex == 1
                  ? const Icon(
                      Icons.dashboard_customize,
                      color: Colors.white,
                    )
                  : const Icon(Icons.dashboard_customize_outlined),
              label: 'Dashboard',
            ),
          ],
        ),
      ),
    );
  }
}
