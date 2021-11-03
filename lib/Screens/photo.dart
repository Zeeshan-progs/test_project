import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:test_project/Controller/photos_controller.dart';
import 'package:test_project/Model/photo_model.dart';
import 'package:test_project/Screens/photo_detail_page.dart';

class Photos extends StatelessWidget {
  Photos({Key? key}) : super(key: key);
  final controller = Get.put(PhotosController());
  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: FutureBuilder(
        future: controller.getData(),
        builder: (context, AsyncSnapshot<List<PhotoModel>> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            // print(snapshot.data!.length);
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var data = snapshot.data![index];

                return GestureDetector(
                  onTap: () {
                    Get.to(DetailPhoto(data: data));
                  },
                  child: Card(
                    elevation: 5,
                    margin: const EdgeInsets.all(10),
                    color: Colors.black45,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: SizedBox(
                        // height: 120,
                        width: Get.width,
                        child: Wrap(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 36,
                                  backgroundImage: AssetImage(
                                      'assets/photo-1554936135-d620172e4942.jpg'),
                                ),
                                title: Text(
                                  'User Gallery',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      buildImageDialog(context,
                                          image: data.url);
                                    },
                                    child: Image.network(
                                      data.url,
                                      // height: 200,
                                      // width: Get.width / 2.5,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      buildImageDialog(
                                        context,
                                        image: data.thumbnailUrl,
                                      );
                                    },
                                    child: Image.network(
                                      data.thumbnailUrl,
                                      // height: 200,
                                      // width: Get.width / 2.5,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                // height: 40,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: const [
                                      0.1,
                                      0.8,
                                    ],
                                    colors: [
                                      Colors.black.withOpacity(.6),
                                      Colors.black,
                                    ],
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 10,
                                ),
                                child: Text(
                                  data.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Future<dynamic> buildImageDialog(BuildContext context,
      {required String image}) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Image.network(
          image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
