import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:dio/dio.dart';

var url = 'https://sniperfactory.com/sfac/http_day16_dogs';
final url_dog =
    'https://images.pexels.com/photos/33053/dog-young-dog-small-dog-maltese.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';

final dio = Dio();

Future<Map<String, dynamic>> getHttp() async {
  Response<dynamic> response = await dio.get(url);
  // Map<String, dynamic> responseData = json.decode(response.data);
  // print(response.data['body']);
  // print(response.data.runtimeType);
  return response.data;
}

class loadAnimals extends StatefulWidget {
  loadAnimals({
    super.key,
  });

  Map<String, dynamic> data = {};

  @override
  State<loadAnimals> createState() => _loadAnimalsState();
}

class _loadAnimalsState extends State<loadAnimals> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    print('refresh');
    widget.data = await getHttp();
    print(widget.data);
    if (widget.data.isEmpty) {
      _refreshController.refreshFailed();
    } else {
      setState(() {});
    }

    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // items.add((items.length+1).toString());
    print('loading...');
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data.isEmpty) {
      _onRefresh();
      return Scaffold(
        body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          onLoading: _onLoading,
          onRefresh: _onRefresh,
          child: GridView.builder(
            itemCount: 10,
            itemBuilder: (c, i) => Container(
              height: 100,
              child: Center(
                  child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: CustomCard(url: url_dog, title: 'Loading'),
              )),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          ),
        ),
      );
    } else {
      print('this is not empty');
      print(widget.data['body'].length);
      return Scaffold(
        body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          onLoading: _onLoading,
          onRefresh: _onRefresh,
          child: GridView.builder(
            itemCount: widget.data['body'].length,
            itemBuilder: (c, i) => Container(
              height: 100,
              child: Center(
                  child: CustomCard(
                url: widget.data['body'][i]['url'],
                title: widget.data['body'][i]['msg'],
              )),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
          ),
        ),
      );
    }
  }
}

// custom card widget
class CustomCard extends StatefulWidget {
  const CustomCard({
    Key? key,
    required this.url,
    required this.title,
  }) : super(key: key);
  final String url;
  final String title;
  final isShimmer = false;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2 - 20,
            height: 100,
            child: Image.network(
              widget.url,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(widget.title),
          const Icon(Icons.comment),
        ],
      ),
    );
  }
}
