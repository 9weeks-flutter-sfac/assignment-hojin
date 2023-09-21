import 'package:day4_2/ContentWidget.dart';
import 'package:day4_2/FoodWidget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            foodList = [];
            setState(() {});
          },
          label: Text('초기화하기'),
        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            '분식왕 이테디 주문하기',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ContentWidget(initialFoodList: foodList),
      ),
    );
  }
}
