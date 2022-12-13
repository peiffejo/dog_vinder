import 'package:dog_vinder/entry.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class buttonside extends StatefulWidget {
  buttonside({Key? key}) : super(key: key);

  @override
  State<buttonside> createState() => _buttonsideState();
}

class _buttonsideState extends State<buttonside> {
  List<Entry> liste = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Side"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: liste.length,
              itemBuilder: (context, index) {
                return Text("${liste[index].title}");
              },
            )),
            buildGestureDetector(),
          ],
        ),
      ),
    );
  }

  Widget buildGestureDetector() {
    return GestureDetector(
      onTap: () async {
        var url = Uri.https('jsonplaceholder.typicode.com', '/posts');
        var response = await http.get(url);
        if (response.statusCode == 200) {
          setState(() {
            liste = entryFromJson(response.body);
          });
        } else {
          print("error");
        }
      },
      child: Container(
        width: 200,
        height: 70,
        child: Text("get Jasoon"),
        color: Colors.black12,
      ),
    );
  }
}
