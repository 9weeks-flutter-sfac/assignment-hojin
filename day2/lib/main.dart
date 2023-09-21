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
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 200),
        child: Center(
          child: Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '오늘의 하루는\n',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '어땠나요?',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                width: 300,
                child: PageView(
                  children: [
                    gradientContaier('우울함', Colors.black, Colors.white),
                    gradientContaier('행복함', Colors.orange, Colors.white),
                    gradientContaier('상쾌함', Colors.blue, Colors.green),
                  ],
                ),
              ),
              Divider(),
              Container(
                height: 150,
                color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.account_circle, size: 60),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: '라이언\n',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '기록해보세요\n',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            TextSpan(
                              text: 'Only Python',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            )
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.only(right: 100),
                    ),
                    Icon(
                      Icons.add,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    ));
  }

  Widget gradientContaier(String text, Color startColor, Color endColor) {
    return Container(
      // add text
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [startColor, endColor],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
