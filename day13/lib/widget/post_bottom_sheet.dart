import 'package:day13/model/post.dart';
import 'package:flutter/material.dart';

class PostBottomSheet extends StatelessWidget {
  const PostBottomSheet({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(post.body),
        ],
      ),
    );
  }
}
