import 'package:dog_vinder/buttonSide.dart';
import 'package:flutter/material.dart';

class secondside extends StatelessWidget {
  List<String> filmtitel = [
    "Wednesday",
    "The French Dispatch",
    "Inception",
    "Full Metal Jacket",
    "Rambo",
    "Love actually",
    "Hui Buh",
    "Disney: eine Weihnachtsgeschichte",
    "Paddington",
    "Heat",
  ];

  secondside({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String film = this.filmtitel[2];
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Text(
            "Mein Filmtitel",
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Scrollbar(
                child: ListView.builder(
                  itemCount: filmtitel.length,
                  itemBuilder: (context, index) {
                    return buildPadding(index);
                  },
                ),
              ),
            ),
          ),
              SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => buttonside()),);
                },
                child: Container(
                  width: 200,
                  height: 70,
                  child: Text("Button"),
                  color: Colors.black12,
                ),
              )
            ],

      )),
    );
  }

  Widget buildPadding(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(128, 185, 130, 130),
                borderRadius: BorderRadius.circular(20)),
            height: 100,
            width: double.infinity,
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  width: 80,
                  child: Image.network(
                      "https://cdn.pixabay.com/photo/2016/08/23/15/12/popcorn-1614707_960_720.png"))),
          Container(
            height: 90,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                this.filmtitel[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
