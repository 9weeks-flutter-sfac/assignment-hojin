import 'package:day13/model/post.dart';
import 'package:flutter/material.dart';

import 'post_bottom_sheet.dart';

class PostTile extends StatelessWidget {
  const PostTile({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(post.id.toString()),
      ),
      title: Text(post.title),
      subtitle: Text(post.body),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => PostBottomSheet(post: post),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),);
      },
    );
  }
}
