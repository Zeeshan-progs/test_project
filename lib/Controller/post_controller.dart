import 'dart:convert';

import 'package:get/get.dart';
import 'package:test_project/Model/photo_model.dart';
import 'package:test_project/Model/post_model.dart';

class PostController extends GetxController {
  Future<List<PostModel>> getData() async {
    var postList = <PostModel>[].obs;
    GetHttpClient http = GetHttpClient();
    var response = await http.get("https://jsonplaceholder.typicode.com/posts");
    if (response.statusCode == 200) {
      List convert = (response.body) as List;
      postList.value =
          convert.map<PostModel>((e) => PostModel.fromJson(e)).toList();
    } else {
      Get.snackbar(
        'Error Fetching Data!!',
        '',
        snackPosition: SnackPosition.BOTTOM,
      );
    }

    return postList.value;
  }

  Future<PostModel> getDetail(int id) async {
    var detail = PostModel().obs;
    GetHttpClient http = GetHttpClient();
    var response = await http
        .get("https://jsonplaceholder.typicode.com/posts/${id.toString()}");
    if (response.statusCode == 200) {
      detail.value = PostModel.fromJson(response.body as Map<String, dynamic>);
    } else {
      Get.snackbar(
        'Error Fetching Data!!',
        '',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return detail.value;
  }
}
