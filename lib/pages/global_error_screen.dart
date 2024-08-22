import 'package:flutter/material.dart';

class GlobalErrorScreen extends StatelessWidget {
  final String errorMessage;

  GlobalErrorScreen({required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text(errorMessage)],
        ),
      ),
    );
  }
}
