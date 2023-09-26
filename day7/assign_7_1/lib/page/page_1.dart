import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:assign_7_1/data.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<String> items = imageUrl;
  int currentIndex = 0;
  int previousIndex = -1;

  // Get a random index that is not the same as the current index.
  int _getRandomIndex() {
    final random = Random();
    int randomIndex;
    do {
      randomIndex = random.nextInt(items.length);
    } while (randomIndex == currentIndex);
    return randomIndex;
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // Monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      previousIndex = currentIndex;
      currentIndex = _getRandomIndex();
    });
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // Monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      previousIndex = currentIndex;
      currentIndex = _getRandomIndex();
    });
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: SmartRefresher(
        header: const WaterDropHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: Center(
          child: Card(
            // View image from the current index
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                items[currentIndex],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
