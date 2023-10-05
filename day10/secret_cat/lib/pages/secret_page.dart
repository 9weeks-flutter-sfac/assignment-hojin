import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/secret_cat_sdk.dart';
import 'package:animate_do/animate_do.dart';

var backgroundImg =
    "https://images.unsplash.com/photo-1542831371-29b0f74f9713?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3870&q=80";

class SecretPage extends StatefulWidget {
  const SecretPage({super.key});

  @override
  State<SecretPage> createState() => _SecretPageState();

}

class _SecretPageState extends State<SecretPage> {
  int currentPageIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.star), label: '일반형'),
          NavigationDestination(icon: Icon(Icons.list), label: '게시판형'),
        ],
      ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text("뒤로가기"),
        elevation: 0,
      ),
      body: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(backgroundImg),
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.darken,
              ),
            ),
          ),
          child: FutureBuilder(
            future: SecretCatApi.fetchSecrets(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return PageView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return FadeInRight(
                        delay: Duration(milliseconds: 200),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30.0,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  AssetImage('assets/images/python.png'),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              snapshot.data![index].secret,
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              snapshot.data![index].author?.username ??
                                  "익명",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    });
              }
              return CircularProgressIndicator();
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(backgroundImg),
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.darken,
              ),
            ),
          ),
          child: FutureBuilder(
            future: SecretCatApi.fetchSecrets(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return FadeInRight(
                          delay: Duration(milliseconds: 200),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white54,
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: ListTile(
                                tileColor: Colors.white54,
                                title: Text(snapshot.data![index].secret),
                                subtitle: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(snapshot
                                            .data![index].author?.username ??
                                        "익명"),
                                    Text(snapshot.data![index].createdAt
                                        .toString()),
                                  ],
                                ),
                                leading: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      AssetImage('assets/images/python.png'),
                                ),
                              ),
                            ),
                          ),
                        );
                      });
              }
              return CircularProgressIndicator();
            },
          ),
        )
      ][currentPageIndex],
    );
  }
}

