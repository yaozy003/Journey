import 'package:flutter/material.dart';

const double appBarPercentage = 0.04;
const double BannerADHeight = 52.0;

class ChallengesPage extends StatefulWidget {
  ChallengesPage();

  @override
  _ChallengesPageState createState() => _ChallengesPageState();
}

class _ChallengesPageState extends State<ChallengesPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(height * appBarPercentage),
            child: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0, //remove shadow.
              title: Text(
                "CHALLENGES",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          body: Column(
            children: [
              BannerAD(width: width),
              Container(color: Colors.blue,child: Image.asset("assets/images/ChallengesPageImages/background.png"),)
            ],
          ),
        )));
  }
}

class BannerAD extends StatelessWidget {
  const BannerAD({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: BannerADHeight,
      width: width,
      child: Center(
          child: Text(
        "Test AD",
        style: TextStyle(
            fontSize: 36.0,
            color: Colors.white,
            fontWeight: FontWeight.w700),
      )),
    );
  }
}
