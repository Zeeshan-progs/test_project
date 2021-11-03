import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/Controller/post_controller.dart';
import 'package:test_project/Model/post_model.dart';

class PostDetail extends StatelessWidget {
  PostDetail({Key? key, required this.id}) : super(key: key);
  int id;
  final PostController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    RxBool isSave = false.obs;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Post Detail'),
        ),
        body: Container(
          height: Get.height,
          width: Get.width,
          child: FutureBuilder(
            future: controller.getDetail(id),
            builder: (context, AsyncSnapshot<PostModel> snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/photo-1452697620382-f6543ead73b5.jpg',
                        height: Get.height / 4,
                        width: Get.width,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18.0,
                            vertical: 10,
                          ),
                          child: Text(
                            snapshot.data!.title
                                .toString()
                                .capitalize
                                .toString(),
                            style: GoogleFonts.quicksand(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18.0,
                            vertical: 10,
                          ),
                          child: Text(
                            snapshot.data!.body
                                .toString()
                                .capitalize
                                .toString(),
                            style: GoogleFonts.salsa(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 3,
                      ),
                      ListTile(
                        leading: const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(
                            'assets/pexels-photo-2422287.jpeg',
                          ),
                        ),
                        title: const Text(
                          'Chetan Bhagat',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                          ),
                        ),
                        subtitle: const Text(
                          '03/11/2021 08:24 PM',
                        ),
                        trailing: Obx(
                          () => IconButton(
                            onPressed: () {
                              isSave.value = !isSave.value;
                            },
                            icon: SvgPicture.asset(
                              isSave.value == false
                                  ? 'assets/Fav Stassssr.svg'
                                  : 'assets/Fav Star.svg',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
