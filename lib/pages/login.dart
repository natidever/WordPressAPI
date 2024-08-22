import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/widgets/custom_texts.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
              child: SubText(
                  text:
                      "Stay informed effortlessly. Sign in and explore a world of news"),
            )
          ],
        ),
      ),
    );
  }
}
