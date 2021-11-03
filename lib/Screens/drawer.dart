import 'package:flutter/material.dart';
import 'package:test_project/Controller/save_token.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height - kToolbarHeight,
          width: width,
          color: Colors.blue[900],
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height / 3,
                  width: width,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        right: 10,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 55,
                            width: 55,
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey.withOpacity(.7),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 0,
                        left: 50,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: 30,
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1633177317976-3f9bc45e1d1d?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 40,
                        child: SizedBox(
                          height: 120,
                          width: 120,
                          child: CircularProgressIndicator(
                            strokeWidth: 5,
                            value: 2 / 4,
                            backgroundColor: Colors.grey.withOpacity(.5),
                            valueColor:
                                const AlwaysStoppedAnimation(Colors.pink),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'zeeshan iqbal',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  width: width,
                ),
                buildTab(width, Icons.exit_to_app, 'Logout'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTab(double width, IconData? icon, String title) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          StoreData.logout();
        },
        child: SizedBox(
          width: width / 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: Colors.grey,
                  size: 28,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
