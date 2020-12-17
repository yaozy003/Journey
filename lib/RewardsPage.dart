import 'package:flutter/material.dart';
import 'package:journey/BottomNavigator.dart';
class RewardsPage extends StatefulWidget {
  RewardsPage();


  @override
  _RewardsPageState createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(child: Container(child: Text("Hello world",style: TextStyle(color: Colors.black),),)),
          ],
        ),
      );
  }
}