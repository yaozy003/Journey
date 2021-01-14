import 'package:flutter/cupertino.dart';
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
    double ChanllengesCircle = height * 0.3;
    return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.blue,
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
              ChallengesCircle(
                  ChanllengesCircle: ChanllengesCircle, width: width),
              ChanllengesRecords(
                  height: height,
                  width: width,
                  ChanllengesCircle: ChanllengesCircle),
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
            fontSize: 36.0, color: Colors.white, fontWeight: FontWeight.w700),
      )),
    );
  }
}

class ChallengesCircle extends StatelessWidget {
  const ChallengesCircle({
    Key key,
    @required this.ChanllengesCircle,
    @required this.width,
  }) : super(key: key);

  final double ChanllengesCircle;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ChanllengesCircle,
      width: width,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          FittedBox(
              fit: BoxFit.fill,
              child: Image.asset(
                  "assets/images/ChallengesPageImages/background.png")),
          Image.asset(
            "assets/images/ChallengesPageImages/circle.png",
            width: ChanllengesCircle,
            height: ChanllengesCircle,
          ),
          Stack(alignment: Alignment.center, children: [
            Transform.translate(
                offset: Offset(-10, -22),
                child: Text(
                  "8",
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 53,
                      fontWeight: FontWeight.w700),
                )),
            Transform.rotate(
                origin: Offset(5, 2),
                angle: 2.3,
                child: Divider(
                  color: Colors.white,
                  thickness: 2,
                  height: 5,
                  indent: 180,
                  endIndent: 180,
                )),
            Transform.translate(
              offset: Offset(14, 14),
              child: Text(
                "8",
                style: TextStyle(
                    color: Color(0xFFAAE2FF),
                    fontSize: 21,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Transform.translate(
              offset: Offset(0,45),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Challenges',
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Won',
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

class ChanllengesRecords extends StatelessWidget {
  const ChanllengesRecords({
    Key key,
    @required this.height,
    @required this.width,
    @required this.ChanllengesCircle,
  }) : super(key: key);

  final double height;
  final double width;
  final double ChanllengesCircle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: Colors.white,
      ),
      height: height - ChanllengesCircle - BannerADHeight - 140,
      child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 40),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                height: height * 0.08, // item height
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          color: Color(0xFFF0F8FF),
                          height: double.infinity,
                          width: width * 0.15,
                          child: Image.asset(
                            'assets/images/ChallengesPageImages/trophy (4).png',
                            width: 20,
                            height: 23,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Stack(
                          overflow: Overflow.visible,
                          alignment: Alignment.bottomRight,
                          children: [
                            Positioned(
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://fitbotic.pixelforcesystems.com.au/packs/media/images/default-user-ab9e095c.png"),
                                radius: 25,
                              ),
                            ),
                            Positioned(
                              right: -10,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://fitbotic.pixelforcesystems.com.au/packs/media/images/default-user-ab9e095c.png"),
                                radius: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "YOU WIN!",
                              style: TextStyle(
                                color: Color(0xFF0089FF),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "0/0/2023",
                              style: TextStyle(
                                color: Color(0xFF777777),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF00C4FF),
                                  Color(0xFF0089FF),
                                ],
                                stops: [0.0, 0.7],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "12 SEC",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                              "assets/images/ChallengesPageImages/arrow-left.png"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
