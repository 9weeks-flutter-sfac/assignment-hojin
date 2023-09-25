import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                },
                child: Text('1번 과제')),
            FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdPage()),
                  );
                },
                child: Text('2번 과제')),
            FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FourthPage()),
                  );
                },
                child: Text('3번 과제')),
          ],
        ),
      ),
    );
  }
}

// custom widget which is get animal name and return widget
Widget animalWidget(String animalName) {
  return SizedBox(
    height: 300,
    child: Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(animalName),
        ],
      ),
    ),
  );
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List animalList = ['강아지', '고양이', '앵무새', '토끼', '오리', '거위', '원숭이'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
          itemCount: animalList.length,
          itemBuilder: (context, index) {
            return animalWidget(animalList[index]);
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.vertical_align_top),
        onPressed: () {
          // MaterialPageRoute(builder: (context) => FirstPage()),
          var controller = PrimaryScrollController.of(context);
          controller.jumpTo(0);
        },
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  TextEditingController myController =
      TextEditingController(); // Moved here to persist between rebuilds

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed to avoid memory leaks.
    myController.dispose();
    super.dispose();
  }

  void clearText() {
    setState(() {
      myController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real-Time Text Input'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          clearText();
        },
        child: Icon(Icons.close),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter text...',
              ),
              onChanged: (text) {
                // This onChanged callback will update the text in real-time
                setState(
                    () {}); // Trigger a rebuild to display the updated text
              },
            ),
            SizedBox(height: 16.0),
            Text(
              '${myController.text}', // Display the input text in real-time
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}

class FourthPage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  TextEditingController myController =
      TextEditingController(); // Moved here to persist between rebuilds

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed to avoid memory leaks.
    myController.dispose();
    super.dispose();
  }

  void clearText() {
    setState(() {
      myController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool stateSun = false;
    bool stateStar = false;
    bool stateQuestion = false;

    void toggleSun() {
      setState(() {
        stateSun = !stateSun;
      });
    }

    void toggleStar() {
      setState(() {
        stateStar = !stateStar;
      });
    }

    void toggleQuestion() {
      setState(() {
        stateQuestion = !stateQuestion;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Real-Time Text Input'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Container(
                width: 56,
                child: Center(
                    child: Icon(
                  Icons.sunny,
                  color: stateSun ? Colors.red : Colors.grey,
                ))),
            title: Text(
              'Sun',
            ),
            trailing: IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              onPressed: () {
                toggleSun();
                setState(() {});
              },
            ),
          ),
          ListTile(
            leading: Container(
                width: 56,
                child: Center(
                    child: Icon(
                  Icons.star,
                  color: stateStar ? Colors.yellow : Colors.grey,
                ))),
            title: Text(
              'Star',
            ),
            trailing: IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              onPressed: () {
                toggleStar();
                setState(() {});
              },
            ),
          ),
          ListTile(
            leading: Container(
                width: 56,
                child: Center(
                    child: Icon(
                  Icons.question_mark,
                  color: stateQuestion ? Colors.blue : Colors.grey,
                ))),
            title: Text(
              '?',
            ),
            trailing: IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              onPressed: () {
                toggleQuestion();
                setState(() {});
              },
            ),
          ),
          TextField(
            controller: myController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter text...',
            ),
            onChanged: (text) {
              // This onChanged callback will update the text in real-time
              setState(() {}); // Trigger a rebuild to display the updated text
            },
          ),
        ],
      ),
    );
  }
}
