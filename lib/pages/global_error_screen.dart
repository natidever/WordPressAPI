import 'package:flutter/material.dart';

class GlobalErrorScreen extends StatelessWidget {
  final String errorMessage;

  GlobalErrorScreen({required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Text('errorMessage')],
      ),
    );
  }
}
