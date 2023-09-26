import 'package:assign_7_1/page/page_1.dart';
import 'package:assign_7_1/page/page_2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // make 2 pages
      home: PageView(
        children: [
          Page1(),
          Page2(),

        ]
      )


      );
  }
}
