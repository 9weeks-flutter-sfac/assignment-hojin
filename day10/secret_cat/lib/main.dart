import 'package:flutter/material.dart';
import 'package:secret_cat/pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(
        fontFamily: 'Neo',
      ),
      home: Container(
        width: MediaQuery.of(context).size.width,
        child: MainPage(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/neo-taiga.gif'),
            fit: BoxFit.cover,
          ),

        ),
      ),
    );
  }
}
