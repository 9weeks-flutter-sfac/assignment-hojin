import 'package:flutter/material.dart';
import 'package:secret_cat/pages/author_page.dart';
import 'package:secret_cat/pages/secret_page.dart';
import 'package:secret_cat/pages/upload_page.dart';
import 'package:animate_do/animate_do.dart';

// var backgroundImg =
//     "https://images.unsplash.com/photo-1542831371-29b0f74f9713?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3870&q=80";


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image.asset(
        //   'assets/images/neo-taiga.gif',
        //   // width = device width
        //   width: MediaQuery.of(context).size.width,
        // ),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/images/python.png'),
                    ),
                    SizedBox(height: 10.0),
                    FadeInUp(
                      from: 0,
                      child: Text(
                        "비밀듣는 파이썬",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.yellow),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FadeInRight(
                      from: 30,
                      child: ListTile(
                        tileColor: Colors.white54,
                        title: Text("비밀 보기"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SecretPage()),
                          );
                        },
                        trailing: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage('assets/images/python.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    FadeInRight(
                      from: 60,
                      child: ListTile(
                        tileColor: Colors.white54,
                        title: Text("작성자들 보기"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AuthorPage()),
                          );
                        },
                        trailing: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage('assets/images/python.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    FadeInRight(
                      from: 90,
                      child: ListTile(
                        tileColor: Colors.white54,
                        title: Text("비밀 남기기"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UploadPage()),
                          );
                        },
                        trailing: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage('assets/images/python.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
