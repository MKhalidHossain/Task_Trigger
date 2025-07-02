import 'package:flutter/material.dart';
import 'package:iwalker/feature/home/presentation/screens/home_screen.dart';
import 'package:iwalker/feature/profile/presentation/screens/user_profile_screen.dart';
import 'package:iwalker/feature/task/presentation/screens/all_task_lists.dart';
import 'package:iwalker/feature/task/presentation/screens/create_new_task.dart';

import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

class BottomNevbar extends StatefulWidget {
  const BottomNevbar({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _BottomNevbarState createState() => _BottomNevbarState();
}

class _BottomNevbarState extends State<BottomNevbar>
    with TickerProviderStateMixin {
  // TabController? _tabController;
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();
    //// Use normal tab controller
    // _tabController = TabController(
    //   initialIndex: 1,
    //   length: 4,
    //   vsync: this,
    // );

    //// use "MotionTabBarController" to replace with "TabController", if you need to programmatically change the tab
    _motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MotionTabBar(
        controller:
            _motionTabBarController, // Add this controller if you need to change your tab programmatically
        initialSelectedTab: "Home",
        useSafeArea: true, // default: true, apply safe area wrapper
        labels: const ['Home', 'Tasks', 'New Task', 'Report', 'Profile'],
        icons: const [
          Icons.home_outlined,
          Icons.task_outlined,
          Icons.add_circle_outline, // dummy - handled separately
          Icons.trending_up_outlined,
          Icons.person_outline,
        ],

        // optional badges, length must be same with labels
        badges: [null, null, null, null, null],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: Colors.white,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: Colors.white,
        tabIconSelectedColor: Color(0xff438B92),
        tabBarColor: Color(0xff438B92),
        onTabItemSelected: (int value) {
          setState(() {
            _motionTabBarController!.index = value;
          });
        },
      ),
      body: TabBarView(
        physics:
            const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
        controller: _motionTabBarController,
        children: <Widget>[
          HomeScreen(),
          AllTaskLists(),
          CreateNewTask(),
          AllTaskLists(),
          UserProfileScreen(),
        ],
      ),
    );
  }
}
