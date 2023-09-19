import 'package:flutter/material.dart';

void main() => runApp(MyApp());

const List<String> hypeBoyText = [
  """Baby, got me looking so crazy
빠져버리는 daydream
Got me feeling you
너도 말해줄래""",
  """누가 내게 뭐라든
남들과는 달라 넌
Maybe you could be the one""",
  """날 믿어봐 한 번
I'm not looking for just fun
Maybe I could be the one""",
  """Cause I know what you like boy
You're my chemical hype boy""",
  """내 지난 날들은
눈 뜨면 잊는 꿈
Hype boy 너만 원해
Hype boy 내가 전해""",
];

const List<Color> hypeBoyColor = [
  Colors.red,
  Colors.blue,
  Colors.orange,
  Colors.green,
  Colors.black
];

final List<TextStyle> textStyles = [
  TextStyle(
      color: Colors.black.withOpacity(0.1),
      fontWeight: FontWeight.bold,
      fontSize: 3),
  TextStyle(
      color: Colors.black.withOpacity(0.3),
      fontWeight: FontWeight.bold,
      fontSize: 10),
  TextStyle(
      color: Colors.black.withOpacity(0.5),
      fontWeight: FontWeight.bold,
      fontSize: 10),
  TextStyle(
      color: Colors.black.withOpacity(0.7),
      fontWeight: FontWeight.bold,
      fontSize: 25),
  TextStyle(
      color: Colors.black.withOpacity(0.9),
      fontWeight: FontWeight.bold,
      fontSize: 35),
  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
];

const List<String> lorem = [
  """Lorem Ipsum
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Sed in hendrerit metus.
Nunc consectetur, justo eu tempor tristique, odio mi suscipit lectus, non consequat tellus risus ac sapien.
Fusce at ultricies sapien, ut tincidunt ligula.
Vestibulum non ligula ut purus ullamcorper dignissim in a enim.""",
  """Nullam sed odio vel urna auctor lobortis a in odio.
Cras maximus nulla vitae arcu interdum feugiat.
Maecenas non risus eu libero hendrerit rhoncus at et elit.
Nam nec justo a mi viverra iaculis sed vel justo. Vestibulum dapibus, nulla at fermentum laoreet, libero velit euismod nunc, a facilisis turpis metus vel justo.
""",
  """Pellentesque facilisis consectetur arcu, nec fermentum purus malesuada a.
Sed mattis, tortor eget commodo bibendum, ante leo convallis purus, at volutpat ante orci non purus.
Integer ac massa lacinia, gravida odio eu, finibus arcu.
Nullam rhoncus purus at lectus feugiat, ac euismod dui fermentum. Vivamus bibendum sem ut vestibulum.""",
  '엄준식',
  '이호진',
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ScrollPageView(),
      ),
    );
  }
}

class ScrollPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return SinglePage(pageNumber: (index % 3) + 1); // 1, 2, 3 순으로 반복
      },
    );
  }
}

class SinglePage extends StatelessWidget {
  final int pageNumber;

  SinglePage({required this.pageNumber});

  @override
  Widget build(BuildContext context) {
    if (pageNumber == 1) {
      return Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: '안녕하세요?.\n',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
      );
    } else if (pageNumber == 2) {
      return Center(child: hypeBoyWidget());
    } else {
      return Center(
          child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            style: TextStyle(fontStyle: FontStyle.italic),
            children: List<TextSpan>.generate(
                lorem.length,
                (index) => TextSpan(
                    text: '${lorem[index]}\n\n', style: textStyles[index]))),
      ));
    }
  }
}

class hypeBoyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style:
            TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // 기본 텍스트 스타일
        children: List<TextSpan>.generate(
          hypeBoyText.length,
          (index) => TextSpan(
            text: '${hypeBoyText[index]}\n\n', // 각 텍스트 사이에 공백 추가
            style: TextStyle(color: hypeBoyColor[index]),
          ),
        ),
      ),
    );
  }
}
