import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'widget/animals.dart';

void main() {
  runApp(const AnimalAwait());
}

class AnimalAwait extends StatefulWidget {
  const AnimalAwait({Key? key}) : super(key: key);

  @override
  State<AnimalAwait> createState() => _AnimalAwaitState();
}

class _AnimalAwaitState extends State<AnimalAwait> {
  String connectionStatus = ''; // To store the connection status
  var connectionStatusBool = false;
  late AnimationController controller;

  // Function to check and update the connection status
  void checkInternetConnection() async {
    setState(() {
      connectionStatus = '연결 확인 중'; // Set status to "연결 확인 중"
    });

    await Future.delayed(Duration(seconds: 1)); // Delay for 2 seconds

    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        connectionStatus = '연결 실패';
      });
    } else {
      setState(() {
        connectionStatus = '';
        connectionStatusBool = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() => connectionStatusBool = false); // Set status to "연결 실패"
            checkInternetConnection(); // Call the function on button press
          },
          child: Icon(Icons.check),
        ),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('투썸 플레이스  Await'),
        ),
        body: SafeArea(
          child: Center(
            child: connectionStatusBool ? loadAnimals() : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (connectionStatusBool == false)
                  Text(
                    connectionStatus, // Display the connection status
                    style: TextStyle(fontSize: 24.0),
                  ),
                if (connectionStatus == '연결 확인 중')
                  LoadingAnimationWidget.prograssiveDots(
                      color: Colors.black, size: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
