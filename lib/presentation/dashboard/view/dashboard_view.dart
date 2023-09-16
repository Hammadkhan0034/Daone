import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/account_setting_screen/account_setting_screen.dart';
import 'package:daone/presentation/add_task_screen/add_task_screen.dart';
import 'package:daone/presentation/dashboard/controller/dashboard_controller.dart';
import 'package:daone/presentation/dashboard/view/widget/custom_animated_bottom_bar.dart';
import 'package:daone/presentation/home_one_screen/home_one_screen.dart';
import 'package:daone/presentation/home_screen/home_screen.dart';
import 'package:daone/presentation/select_affirmation_screen/select_affirmation_screen.dart';
import 'package:daone/presentation/view_all_task_page/view_all_task_page.dart';
import 'package:daone/presentation/view_all_task_tab_container_screen/view_all_task_tab_container_screen.dart';
import 'package:daone/presentation/view_friend_full_profile_page/view_friend_full_profile_page.dart';
import 'package:flutter/material.dart';

class MyDashBoard extends StatefulWidget {
  @override
  _MyDashBoardState createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {
  int _currentIndex = 0;

  final _inactiveColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(index: controller.tabIndex, children: [
            HomeOneScreen(),
            ViewAllTaskTabContainerScreen(),
            SelectAffirmationScreen(),
            AccountSettingScreen(),
          ]),
        ),
        bottomNavigationBar: CustomAnimatedBottomBar(
          containerHeight: 70,
          backgroundColor: Colors.white,
          selectedIndex: controller.tabIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: controller.changeTabIndex,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: Icon(Icons.apps),
              title: Text('Home'),
              activeColor: Colors.green,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.people),
              title: Text('Users'),
              activeColor: Colors.purpleAccent,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.message),
              title: Text(
                'Messages ',
              ),
              activeColor: Colors.pink,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              activeColor: Colors.blue,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    });
  }

  Widget getBody() {
    List<Widget> pages = [
      HomeScreen(),
      ViewAllTaskPage(),
      AddTaskScreen(),
      ViewFriendFullProfilePage(),
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }
}
