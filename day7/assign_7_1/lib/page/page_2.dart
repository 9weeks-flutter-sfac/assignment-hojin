import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:assign_7_1/data.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<String> items = imageUrl;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body:  Center(
        child: CarouselSlider(
          options: CarouselOptions(height: 200.0,
          autoPlay: true,
            autoPlayInterval: Duration(seconds: 2, milliseconds: 500),
          ),
          items: items.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(i),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
