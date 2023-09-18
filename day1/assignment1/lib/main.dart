import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: '안녕하세요?.\n',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: const <TextSpan>[
                TextSpan(text: '간단하게 제 '),
                TextSpan(
                    text: '소개',
                    style: TextStyle(fontSize: 20, color: Colors.blue)),
                TextSpan(text: '를 해보겠습니다\n\n'),
                TextSpan(text: '먼저 저의 MBTI는'),
                TextSpan(
                    text: 'PPAP',
                    style: TextStyle(fontSize: 20, color: Colors.red)),
                TextSpan(text: '이고\n'),
                TextSpan(text: '직업은'),
                TextSpan(
                    text: '백수',
                    style: TextStyle(fontSize: 20, color: Colors.green)),
                TextSpan(text: '입니다.\n\n'),
                TextSpan(
                    text: '꿈',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.black,
                    )),
                TextSpan(
                    text: '은 없구요.\n',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.black,
                    )),
                TextSpan(
                    text: '그냥 놀고 싶숩니다.\n\n',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.black,
                    )),
                TextSpan(
                    text: '감사합니다.',
                    style: TextStyle(fontSize: 20, color: Colors.pink))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
