import 'package:day13/widget/post_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/post.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Dio dio = Dio();

  Future<List<Post>> readData() async {
    var url = "https://jsonplaceholder.typicode.com/posts";
    var res = await dio.get(url);
    if (res.statusCode == 200) {
      var data = List<Map<String, dynamic>>.from(res.data);
      return data.map((e) => Post.fromMap(e)).toList();
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: readData(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return ListView.separated(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) =>
                  PostTile(post: snapshot.data![index]),
              separatorBuilder: (context, index) => ((index + 1) % 5) == 0
                  ? Text('Post ${index + 2} ~ ${index + 5 + 1}', style: TextStyle(fontSize: 36),)
                  : SizedBox(),
            );
          }
          return LinearProgressIndicator();
        },
      ),
    );
  }
}
