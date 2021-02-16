import 'package:flutter/material.dart';
import 'package:restaurant/mydrawer.dart';
import 'package:restaurant/test.dart';

import 'category.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    // home: Home(),
      home: Category(),
    );
  }
}