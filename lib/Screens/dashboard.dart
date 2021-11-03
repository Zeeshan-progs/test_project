import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/Screens/drawer.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  List<String> images = [
    'https://images.unsplash.com/photo-1633177317976-3f9bc45e1d1d?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1633113093730-47449a1a9c6e?ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxMXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1633209942287-701d44019290?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3N3x8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1633287387306-f08b4b3671c6?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1633269540827-728aabbb7646?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1OXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1633183601291-ec3ddf252825?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2OXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1633267538438-2d49aeb844f7?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2N3x8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 70,
        actions: [
          SizedBox(
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.transparent,
                  backgroundImage:
                      AssetImage('assets/photo-1554936135-d620172e4942.jpg'),
                ),
              ],
            ),
          ),
        ],
        title: Text(
          'Home',
          style: GoogleFonts.lato(
            fontSize: 19,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.blue[900],
        ),
        // leading: Center(
        //   child: GestureDetector(
        //     onTap: () {
        //       Scaffold.of(context).openDrawer();
        //     },
        //     child: Image.asset(
        //       'assets/menu.png',
        //       color: Colors.blue[900],
        //       height: 30,
        //       width: 30,
        //     ),
        //   ),
        // ),
      ),
      drawer: const Drawer(
        child: DrawerScreen(),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText('Featured Articles'),
                featuredArticleWidget(),
                buildSizedBox(),
                buildText('Featured Videos'),
                buildFeaturedVideos(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildFeaturedVideos() {
    return SizedBox(
      height: Get.height / 4,
      width: Get.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            5,
            (index) => Card(
              child: Stack(
                children: [
                  Image.network(
                    images[index],
                    width: Get.width / 1.3,
                    height: Get.height / 4,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: (Get.height / 4) / 2.5,
                    left: (Get.width / 1.3) / 2.5,
                    child: const Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          CupertinoIcons.play,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox() => const SizedBox(
        height: 15,
      );

  Text buildText(String text) {
    return Text(
      text,
      style: GoogleFonts.lato(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Colors.black,
      ),
    );
  }

  SizedBox featuredArticleWidget() {
    return SizedBox(
      height: Get.height / 2,
      width: Get.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            5,
            (index) => Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26),
              ),
              margin: const EdgeInsets.all(10),
              elevation: 6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(26),
                child: Stack(
                  children: [
                    Image.network(
                      images[index],
                      fit: BoxFit.cover,
                      height: Get.height / 2,
                      width: Get.width / 2.5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(26),
                        ),
                      ),
                      child: const Icon(
                        CupertinoIcons.heart_circle,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: Get.width / 2.5,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue[900]!,
                              Colors.blue[700]!,
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),
                        child: Column(
                          children: [
                            Text(
                              images[index]
                                  .replaceAll('\\', '')
                                  .replaceAll('https://', '')
                                  .toString(),
                              maxLines: 3,
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'READ NOW',
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: SvgPicture.asset(
                                    'assets/Fav Stassssr.svg',
                                    height: 25,
                                    width: 25,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
