import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/Screens/login_screen.dart';

class StoreData {
  static Future<String?> getToken() async {
    var per = await SharedPreferences.getInstance();

    var token = per.getString('token');
    return token;
  }

  static Future<bool> setToken(String key, String data) async {
    var per = await SharedPreferences.getInstance();

    var token = per.setString(key, data);
    return token;
  }

  static Future logout() async {
    var per = await SharedPreferences.getInstance();
    per.clear();
    Get.offUntil(
        GetPageRoute(
          page: () => LogIn(),
        ),
        (route) => false);
  }
}
