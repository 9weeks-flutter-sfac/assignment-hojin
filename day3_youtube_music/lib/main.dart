import 'package:flutter/material.dart';
import 'package:day3_youtube_music/MusicTile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.dark(),
      ),
      home: Scaffold(
        appBar: AppBar(
          shape: Border(
            bottom: BorderSide(color: Colors.white24, width: 1),
          ),
          leading: Icon(Icons.navigate_before),
          title: Text('아워리스트'),
          elevation: 0,
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.airplay),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
          ],
        ),
        body: ListView(
          children: [
            MusicTile(
              title: 'Good day',
              artist: 'Surfaces',
              runningTime: '3:02',
              albumImg: 'assets/music_come_with_me.png',
            ),
            MusicTile(
              title: 'Honesty ',
              artist: 'Pink Sweat\$',
              runningTime: '3:02',
              albumImg: 'assets/music_honesty.png',
            ),
            MusicTile(
              title: 'These days(feat. Jess Glynne, Macklemore & Dan Caplen)',
              artist: 'Rudimental',
              runningTime: '3:02',
              albumImg: 'assets/music_these_days.png',
            ),
            MusicTile(
              title: 'Summer is for falling in love',
              artist: ' Sarah Kang & Eye Love Brandon',
              runningTime: '3:02',
              albumImg: 'assets/music_summer_is_for_falling_in_love.png',
            ),
            MusicTile(
              title: 'Come with me',
              artist: ' Surfaces 및 salem ilese',
              runningTime: '3:02',
              albumImg: 'assets/music_come_with_me.png',
            ),
            MusicTile(
              title: 'I Wish I Missed My Ex',
              artist: ' 마할리아 버크마',
              runningTime: '3:02',
              albumImg: 'assets/music_i_wish_i_missed_my_ex.png',
            ),
            MusicTile(
              title: 'Plastic Plants',
              artist: ' 마할리아 버크마',
              runningTime: '3:02',
              albumImg: 'assets/music_plastic_plants.png',
            ),
            MusicTile(
              title: 'Sucker for you',
              artist: '맷 테리',
              runningTime: '3:02',
              albumImg: 'assets/music_summer_is_for_falling_in_love.png',
            ),
            MusicTile(
              title: 'Zombie Pop',
              artist: 'DRP IAN',
              runningTime: '3:02',
              albumImg: 'assets/music_zombie_pop.png',
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
          fixedColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: '둘러보기',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music),
              label: '보관함',
            ),
          ],
        ),
        bottomSheet: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 64,
              color: Colors.white12,
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset('assets/music_you_make_me.png'),
                ),
                title: Text('You Make M'),
                subtitle: Text('DAY6'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.play_arrow),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.skip_next),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              //재생바
              height: 1,
              alignment: Alignment.centerLeft,
              child: Container(width: 120, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
