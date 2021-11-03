import 'dart:convert';

import 'package:get/get.dart';
import 'package:test_project/Model/photo_model.dart';

class PhotosController extends GetxController {
  Future<List<PhotoModel>> getData() async {
    var photoList = <PhotoModel>[].obs;
    GetHttpClient http = GetHttpClient();
    var response =
        await http.get("https://jsonplaceholder.typicode.com/photos");
    if (response.statusCode == 200) {
      List convert = (response.body) as List;
      photoList.value =
          convert.map<PhotoModel>((e) => PhotoModel.fromJson(e)).toList();
    } else {
      Get.snackbar(
        'Error Fetching Data!!',
        '',
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    return photoList.value;
  }
}
