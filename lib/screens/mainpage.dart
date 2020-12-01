import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  static const String id = 'mainpage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
