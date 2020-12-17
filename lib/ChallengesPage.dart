import 'package:flutter/material.dart';
import 'package:journey/BottomNavigator.dart';
class ChallengesPage extends StatefulWidget {
  ChallengesPage();

  @override
  _ChallengesPageState createState() => _ChallengesPageState();
}

class _ChallengesPageState extends State<ChallengesPage> {



  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
                child: Container(
              child: Text(
                "Hello world",
                style: TextStyle(color: Colors.black),
              ),
            )),
          ],
        ),
      );
  }
}