import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/Controller/post_controller.dart';
import 'package:test_project/Model/post_model.dart';

import 'post_detail_page.dart';

class Post extends StatelessWidget {
  Post({Key? key}) : super(key: key);
  final controller = Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    return FutureBuilder(
      future: controller.getData(),
      builder: (BuildContext context, AsyncSnapshot<List<PostModel>> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return ListView.separated(
            itemBuilder: (context, index) {
              var data = snapshot.data![index];
              return GestureDetector(
                onTap: () {
                  Get.to(PostDetail(id: data.id!));
                },
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  leading: SizedBox(
                    width: 40,
                    child: Flexible(
                      fit: FlexFit.loose,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: CircleAvatar(
                                backgroundColor: Color.fromARGB(
                                        Random().nextInt(255),
                                        Random().nextInt(255),
                                        Random(35).nextInt(255),
                                        Random().nextInt(255))
                                    .withOpacity(.1)),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              (index + 1).toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  title: Text(
                    data.title.toString().capitalize.toString(),
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data.body.toString().capitalize.toString(),
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(
              height: 5,
              thickness: 5,
            ),
            itemCount: snapshot.data!.length,
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
