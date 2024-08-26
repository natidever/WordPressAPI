import 'package:flutter/material.dart';

class GlobalErrorScreen extends StatelessWidget {
  final String errorMessage;

  GlobalErrorScreen({required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    print("Error$errorMessage");
    print("Error$errorMessage");
    print("Error$errorMessage");
    print("Error$errorMessage");
    print("Error$errorMessage");
    print("Error$errorMessage");
    print("Error$errorMessage");
    print("Error$errorMessage");

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  print("Error$errorMessage");
                },
                child: Text(errorMessage)),
          ],
        ),
      ),
    );
  }
}
