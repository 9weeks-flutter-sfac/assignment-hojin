import 'package:flutter/material.dart';

class MusicTile extends StatelessWidget {
  const MusicTile(
      {super.key,
      required this.title,
      required this.artist,
      required this.runningTime,
      required this.albumImg});
  final String title;
  final String artist;
  final String runningTime;
  final String albumImg;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.asset(albumImg),
      ),
      title: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: [
          Icon(
            Icons.check_circle,
            size: 18,
          ),
          SizedBox(
            width: 4,
          ),
          Flexible(
            child: Text(
              artist,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Text('•'),
          SizedBox(
            width: 4,
          ),
          Text(runningTime),
        ],
      ),
      trailing: Icon(Icons.more_vert),
    );
  }
}
