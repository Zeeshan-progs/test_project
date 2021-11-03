import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/Controller/home_controller.dart';
import 'package:test_project/Controller/photos_controller.dart';
import 'package:test_project/Model/photo_model.dart';
import 'package:test_project/Screens/photo.dart';
import 'package:test_project/Screens/post.dart';

import 'photo_detail_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final homeController = Get.put(HomeController());
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TabBar(
                indicatorColor: Colors.blue[900],
                labelPadding: const EdgeInsets.all(10),
                unselectedLabelColor: Colors.grey,
                unselectedLabelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                automaticIndicatorColorAdjustment: true,
                labelColor: Colors.blue[900],
                indicatorWeight: 2,
                tabs: const [
                  Tab(
                    child: Text('Photos'),
                  ),
                  Tab(
                    child: Text('Posts'),
                  )
                ],
                controller: tabController,
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Photos(),
                    Post(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
