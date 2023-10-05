import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/secret_cat_sdk.dart';

var backgroundImg =
    "https://images.unsplash.com/photo-1542831371-29b0f74f9713?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3870&q=80";

// get author list from SecretCatApi

// var authors = SecretCatApi.fetchAuthors();
// List<String> listDropItem = <String>['익명'];

// author to listDropItem

// void authorToDropItem(List<Author> authors) {
//   for (var author in authors) {
//     listDropItem.add(author.username);
//   }
// }

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  // String dropdownValue = listDropItem.first;

  // @override
  // void initState() {
  //   super.initState();
  //   // Call fetchAuthors and then call authorToDropItem once the data is available
  //   SecretCatApi.fetchAuthors().then((authors) {
  //     authorToDropItem(authors);
  //     setState(() {}); // Update the UI after authorToDropItem is called
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    var controller = TextEditingController();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text("뒤로가기"),
        elevation: 0,
      ),
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   color: Colors.white54,
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Row(
              //       children: [
              //         Text("작성자:"),
              //         SizedBox(width: 20.0),
              //         DropdownButton(
              //           value: dropdownValue,
              //           onChanged: (String? value) {
              //             // This is called when the user selects an item.
              //             setState(() {
              //               dropdownValue = value!;
              //             });
              //           },
              //           items: listDropItem.map<DropdownMenuItem<String>>((String value) {
              //             return DropdownMenuItem<String>(
              //               value: value,
              //               child: Text(value),
              //             );
              //           }).toList(),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              TextField(
                controller: controller,
                minLines: 7,
                maxLines: 7,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white54,
                  hintText: "비밀을 입력해주세요",
                  hintStyle: TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    var secret = await SecretCatApi.addSecret(controller.text);
                    if (secret != '') {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("업로드 성공! ${secret!.secret}")));
                    }
                  },
                  child: Text("업로드")),
            ],
          ),
        ),
      ),
    );
  }
}
