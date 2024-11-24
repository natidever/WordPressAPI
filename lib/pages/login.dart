import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/controllers/login_controller.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/widgets/custom_buttons.dart';
import 'package:news_app/widgets/custom_form.dart';
import 'package:news_app/widgets/custom_texts.dart';
import 'package:news_app/widgets/layout_helper.dart';

class Login extends StatelessWidget {
  // const Login({super.key});

  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: SecondaryText600(fontSize: 26.0, text: "Sign In "),
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          // Expanded(
          //     child: Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          //   child: SecondaryText600(fontSize: 26.0, text: "Sign In "),
          // ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 5, 0),
          child: Column(
            children: [
              SubText(
                  text:
                      "Stay informed effortlessly. Sign in and explore a world of news"),
              // 32
              VerticalSpace(32),

              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Container(
                  // 392*64
                  width: 392,
                  height: 63,
                  decoration: BoxDecoration(
                      // color: Color.fromRGBO(63, 63, 64, 1),
                      color: Color.fromRGBO(243, 243, 243, 0.4),

                      // color: Color.fromRGBO(236, 239, 239, 1),
                      borderRadius: BorderRadius.circular(10)),

                  child: TextFormField(
                    obscureText: false,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: InputBorder.none,
                        prefixIconConstraints: BoxConstraints(
                          maxHeight: 30,
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Image.asset('assets/images/icons/email.png'),
                        ),
                        prefixIconColor: subTextColor,
                        hintStyle: GoogleFonts.sourceSans3(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: subTextColor),
                        hintText: 'Email'),
                  ),
                ),
              ),
              VerticalSpace(16),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Container(
                  // 392*64
                  width: 392,
                  height: 63,
                  decoration: BoxDecoration(
                      // color: Color.fromRGBO(249, 252, 254, 1),
                      color: Color.fromRGBO(243, 243, 243, 0.4),

                      // color: Color.fromRGBO(236, 239, 239, 1),
                      borderRadius: BorderRadius.circular(10)),

                  child: Obx(() {
                    return TextFormField(
                      obscureText:
                          controller.isPasswordVissible.isTrue ? false : true,
                      // obscureText: true,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          border: InputBorder.none,
                          prefixIconConstraints: BoxConstraints(
                            maxHeight: 30,
                          ),
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child:
                                Image.asset('assets/images/icons/password.png'),
                          ),
                          prefixIconColor: subTextColor,
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.TogglePasswordVissiblity();
                              },
                              icon: Icon(
                                  color: subTextColor,
                                  //Toggle between two icons based on the password is vissible or not
                                  controller.isPasswordVissible.value == false
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                          hintStyle: GoogleFonts.sourceSans3(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: subTextColor),
                          hintText: 'Password'),
                    );
                  }),
                ),
              ),
              // b/n 16
              VerticalSpace(7),
              Row(
                children: [
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: TextButton(
                        onPressed: () {},
                        child: SubText(text: "Forgot Passowrd")),
                  ),
                ],
              ),
              VerticalSpace(25),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () {
                      Get.toNamed('/base_screen');
                    },
                    child: CustomPrimaryButton('Sign In', 382, 55, 10)),
              ),

              VerticalSpace(39),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: HorizontalLine(height: 1, width: 140),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      'or',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: HorizontalLine(height: 1, width: 150),
                    ),
                  ),
                ],
              ),
              VerticalSpace(40),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomSecondaryButton("Sign in with Google", 10.0,
                    'assets/images/icons/google.png'),
              ),
              VerticalSpace(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomSecondaryButton("Sign in with Facebook", 10.0,
                    'assets/images/icons/facebook.png'),
              ),

              // forgot=8
              // 392*64
              VerticalSpace(MediaQuery.of(context).size.height * 0.14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SubText(text: "Don't have an account "),
                  Text(
                    "Sign Up",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  )
                ],
              ),

              //Custom form
              CustomForm(isPassword: false, hintText: 'hintText')
            ],
          ),
        ),
      ),
    );
  }
}
