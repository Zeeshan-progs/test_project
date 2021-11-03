import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:test_project/Controller/bottombar_controller.dart';
import 'package:test_project/Screens/home_screen.dart';

import 'dashboard.dart';

class Base extends StatelessWidget {
  final TextStyle unselectedLabelStyle = const TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );

  final TextStyle selectedLabelStyle = const TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );

  buildBottomNavigationMenu(context, bottombarcontroller) {
    return Obx(
      () => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          // height: 60,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: bottombarcontroller.changeTabIndex,
            currentIndex: bottombarcontroller.tabIndex.value,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blue[900],
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: const [
              BottomNavigationBarItem(
                // icon: Icon(
                //   CupertinoIcons.house_fill,
                //   size: 25.0,
                // ),
                icon: Icon(
                  CupertinoIcons.home,
                  size: 25,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.arrowtriangle_left_square,
                  size: 25.0,
                ),
                label: 'Explore',
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final BottomBarController bottombarcontroller =
        Get.put(BottomBarController(), permanent: false);
    return Scaffold(
      bottomNavigationBar:
          buildBottomNavigationMenu(context, bottombarcontroller),
      body: Obx(() => IndexedStack(
            index: bottombarcontroller.tabIndex.value,
            children: [
              Dashboard(),
              HomeScreen(),
              // ProfileScreen(),
            ],
          )),
    );
  }
}
