import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_project/Controller/save_token.dart';
import 'package:test_project/Screens/home_screen.dart';

class AuthController extends GetxController {
  var loading = false.obs;
  RxBool show = false.obs;
  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  Future login() async {
    GetHttpClient connect = GetHttpClient();
    var response = await connect.post(
      'https://reqres.in/api/login',
      //eve.holt@reqres.in
      //pistol
      body: {
        "email": email.text,
        "password": pass.text,
      },
    );
    if (response.statusCode == 200) {
      var convert = jsonDecode(response.bodyString!);
      StoreData.setToken('token', convert['token'].toString()).then((value) {
        if (value == true) {
          Get.offUntil(
              GetPageRoute(
                page: () => HomeScreen(),
              ),
              (route) => false);
        }
      });
    } else {
      Get.snackbar(
        'ERROr !!!',
        'Api response ${response.statusCode}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void validate() {
    if (formKey.currentState!.validate()) {
      loading.value = true;
      login().then(
        (value) => loading.value = false,
      );
    }
  }
}
