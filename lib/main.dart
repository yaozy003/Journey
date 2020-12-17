import 'package:flutter/material.dart';
import 'package:journey/JourneyPage.dart';
import 'package:journey/WorkOutPage.dart';
import 'package:journey/Navigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JOURNEY',
      theme: ThemeData(
        fontFamily: 'GoogleFonts.lato',
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w700),
          headline2: TextStyle(
              fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w700),
          headline3: TextStyle(
              fontSize: 9.0, color: Colors.black, fontWeight: FontWeight.normal),
          bodyText1: TextStyle(
              fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w700),
          bodyText2: TextStyle(fontSize: 12.0, color: Colors.white),
          headline6: TextStyle(
              fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      initialRoute: '/HomePage',
      routes: {
        '/HomePage': (context) => NavigatorPage(),
      },
    );
  }
}


