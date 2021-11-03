import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/Controller/auth_controller.dart';

class LogIn extends StatelessWidget {
  final loginAuth = Get.put(AuthController());
  final TextEditingController contact = TextEditingController();

  LogIn({Key? key}) : super(key: key);

  Color iconColor = const Color(0xff98a5c0);
  Color cardColor = const Color(0xffccd3e6);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1635492491273-455af7728453?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=660&q=80",
                ),
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
            ),
            height: height,
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Obx(
              () => Stack(
                children: [
                  Form(
                    key: loginAuth.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textFields(
                          hint: "Email Address",
                          icon: Icons.alternate_email,
                          controller: loginAuth.email,
                        ),
                        buildSizedBox(),
                        textFields(
                          hint: "Password",
                          icon: Icons.lock_outline,
                          controller: loginAuth.pass,
                        ),
                        buildSizedBox(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: cardColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          onPressed: loginAuth.validate,
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff8464bb),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  loginAuth.loading.value == true
                      ? Container(
                          height: height,
                          width: width,
                          color: iconColor.withOpacity(.3),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox() => const SizedBox(height: 20);

  Card textFields({
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    bool? isVisible,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
      ),
      color: cardColor,
      // elevation: 4,
      // shadowColor: const Color(0xffccd3e6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
          Expanded(
            child: hint == 'Password'
                ? passwordTextField(controller, hint)
                : emailTextField(controller, hint),
          ),
        ],
      ),
    );
  }

  TextFormField emailTextField(TextEditingController controller, String hint) {
    return TextFormField(
      validator: (value) {
        if (value == null) return 'Enter Email';
        if (value.isEmpty) return 'Enter Email';
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        border: InputBorder.none,
      ),
    );
  }

  TextFormField passwordTextField(
      TextEditingController controller, String hint) {
    return TextFormField(
      validator: (value) {
        if (value == null) return 'Enter password';
        if (value.isEmpty) return 'Enter password';
        if (value.length < 5) return 'Enter valid password';
      },
      controller: controller,
      obscureText: loginAuth.show.value,
      decoration: InputDecoration(
        hintText: hint,
        border: InputBorder.none,
        suffixIcon: IconButton(
          onPressed: () {
            loginAuth.show.value = !loginAuth.show.value;
          },
          icon: Icon(
            Icons.visibility,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
