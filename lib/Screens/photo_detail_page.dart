import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/Model/photo_model.dart';

class DetailPhoto extends StatelessWidget {
  DetailPhoto({
    Key? key,
    required this.data,
  }) : super(key: key);
  PhotoModel data;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              Image.network(
                data.thumbnailUrl,
                height: Get.height / 3,
                width: Get.width,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
              Positioned(
                top: Get.height / 3.6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      children: [
                        Image.network(
                          data.url,
                          height: Get.height / 3,
                          width: Get.width,
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            data.title,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
