import 'package:daone/core/app_export.dart';
import 'package:daone/presentation/account_setting_screen/account_setting_screen.dart';
import 'package:daone/presentation/dashboard/controller/dashboard_controller.dart';
import 'package:daone/presentation/dashboard/view/widget/custom_animated_bottom_bar.dart';
import 'package:daone/presentation/home_one_screen/home_one_screen.dart';
import 'package:daone/presentation/home_screen/home_screen.dart';
import 'package:daone/presentation/select_task_screen/select_task_screen.dart';
import 'package:daone/presentation/stats_screen/stats_screen.dart';
import 'package:daone/presentation/view_all_task_page/view_all_task_page.dart';
import 'package:daone/presentation/view_all_task_tab_container_screen/view_all_task_tab_container_screen.dart';
import 'package:daone/presentation/view_friend_full_profile_page/view_friend_full_profile_page.dart';
import 'package:flutter/material.dart';
import '../../add_task_screen/add_task_screen.dart';

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
            SelectTaskScreen(),
            StatsScreen(),
            AccountSettingScreen(),
          ]),
        ),
        bottomNavigationBar: CustomAnimatedBottomBar(
          containerHeight:Get.height*0.086,
          backgroundColor: Colors.white,
          selectedIndex: controller.tabIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: controller.changeTabIndex,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
             image: Image.asset('assets/images/BIcon1.png',scale: 5),
              title: Text('Home'),
              activeColor: Colors.deepOrange,
             inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              image: Image.asset('assets/images/BIcon2.png',scale: 4),
              title: Text('Users'),
              activeColor: Colors.deepOrange,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              image: Image.asset('assets/images/BIcon3.png',),
              title: Text(
                'Messages ',
              ),
              activeColor: Colors.deepOrange,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              image: Image.asset('assets/images/BIcon4.png',scale: 5),
              title: Text('Settings'),
              activeColor: Colors.deepOrange,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              image: Image.asset('assets/images/BIcon5.png',scale: 5,),
              title: Text('Settings'),
              activeColor:  Colors.deepOrange,
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
