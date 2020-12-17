import 'package:flutter/material.dart';
import 'package:journey/BottomNavigator.dart';
class WorkoutPage extends StatefulWidget {
  WorkoutPage();

  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {



  @override
  Widget build(BuildContext context) {
    return  Center(
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