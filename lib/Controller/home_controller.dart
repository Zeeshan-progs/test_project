import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:get/get.dart';
import 'package:test_project/Controller/save_token.dart';
import 'package:test_project/Screens/login_screen.dart';

class HomeController extends GetxController {
  TabController? tabController;

  Future checkUser() async {
    var token = await StoreData.getToken();
    if (token == null) {
      Get.offUntil(
        GetPageRoute(
          page: () => LogIn(),
        ),
        (route) => false,
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkUser();
  }
}
