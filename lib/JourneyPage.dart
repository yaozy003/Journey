import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:journey/PathPainter.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:journey/models/map_dots.dart';

class JourneyPage extends StatefulWidget {
  JourneyPage({this.title});
  final String title;

  @override
  _JourneyPageState createState() => _JourneyPageState();
}

class _JourneyPageState extends State<JourneyPage>
    with SingleTickerProviderStateMixin {
  List<Dot> dots = [];

  //Animation Controller & Tween for dots.
  AnimationController _animationController;
  Animation<double> _doubleAnim;

  void loadJsonData() async {
    String jsonString = await rootBundle.loadString('assets/journeyMap.json');
    Map<String, dynamic> data = json.decode(jsonString);
    MapDots mapdots = await MapDots.fromJson(data);
    dots = mapdots.dots;
  }

  @override
  void initState() {
    super.initState();
    this.loadJsonData();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 1000,
        ),
        value: 1.0);
    _doubleAnim =
    Tween(begin: 0.80000, end: 1.150000).animate(_animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          //动画在结束时停止的状态
          _animationController.reverse(); //颠倒
        } else if (status == AnimationStatus.dismissed) {
          //动画在开始时就停止的状态
          _animationController.forward(); //向前
        }
      });
    // ..addListener(() {
    //   setState(() {});
    // });
    _animationController.forward();
  }

  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width; //screen width
    double height = MediaQuery
        .of(context)
        .size
        .height; //screen height
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          //resizeToAvoidBottomPadding:true,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: AppBar(
              title: Text(
                widget.title,
                style: Theme
                    .of(context)
                    .textTheme
                    .headline1,
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0, //remove shadow.
            ),
          ),
          body: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 15.0),
                  child: ToggleSwitch(
                    minWidth: 170.0,
                    minHeight: 33.0,
                    fontSize: 14.0,
                    initialLabelIndex: 0,
                    cornerRadius: 24.0,
                    activeBgColor: Colors.blue,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.white,
                    inactiveFgColor: Colors.grey,
                    labels: ['Journey Map', 'Activity'],
                    onToggle: (index) {
                      print('switched to: $index');
                      //TODO:linked to another page.
                    },
                  ),
                ),
              ]), //toggle switch
              //试用通知
              Expanded(
                child: Container(
                  color: Colors.blue,
                  width: width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: 2 * MediaQuery
                              .of(context)
                              .size
                              .height),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          // Container(
                          //   //notification rect
                          //   width: width,
                          //   height: 56,
                          //   color: Colors.blue,
                          //   child: Row(
                          //     children: <Widget>[
                          //       Padding(
                          //         padding: const EdgeInsets.fromLTRB(
                          //             16.0, 14.0, 16.0, 14.0),
                          //         child: const Image(
                          //           image: AssetImage(
                          //               'assets/images/Badge.png'),
                          //         ),
                          //       ),
                          //       Column(
                          //         //put two text on the top
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         mainAxisAlignment:
                          //         MainAxisAlignment.spaceEvenly,
                          //         children: [
                          //           Text(
                          //             '{2} MORE GOALS TO EARN YOUR \$10 BONUS!',
                          //             textAlign: TextAlign.left,
                          //             style:
                          //             Theme
                          //                 .of(context)
                          //                 .textTheme
                          //                 .bodyText2,
                          //           ),
                          //           Text(
                          //             'You have {3} days left of your free trial.',
                          //             style:
                          //             Theme
                          //                 .of(context)
                          //                 .textTheme
                          //                 .bodyText2,
                          //           ),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(15),
                          //     color: Color(0xFF0A87BB),
                          //   ),
                          //   //Today's Goal
                          //
                          //   height: height * 0.18,
                          //   //Goal's box height
                          //   margin: EdgeInsets.all(15),
                          //   width: width,
                          //   child: Column(
                          //     //crossAxisAlignment: CrossAxisAlignment.stretch,
                          //     children: [
                          //       Expanded(
                          //           flex: 3,
                          //           child: Center(
                          //               child: Text(
                          //                 "TODAY'S GOAL",
                          //                 style:
                          //                 Theme
                          //                     .of(context)
                          //                     .textTheme
                          //                     .bodyText1,
                          //               ))), //TODO:style
                          //       Expanded(
                          //         flex: 6,
                          //         child: Padding(
                          //           padding: const EdgeInsets.only(
                          //               left: 10,
                          //               top: 0,
                          //               right: 10,
                          //               bottom: 10),
                          //           child: Row(
                          //             children: [
                          //               Expanded(
                          //                 child: Container(
                          //                   decoration: BoxDecoration(
                          //                     borderRadius: BorderRadius.only(
                          //                       topLeft: Radius.circular(15),
                          //                       bottomLeft: Radius.circular(15),
                          //                     ),
                          //                     color: Color(0xFF53ABCF),
                          //                   ),
                          //                   child: Column(
                          //                       mainAxisAlignment:
                          //                       MainAxisAlignment
                          //                           .spaceEvenly,
                          //                       children: [
                          //                         Text(
                          //                           "COMPLETED",
                          //                           style: Theme
                          //                               .of(context)
                          //                               .textTheme
                          //                               .bodyText2,
                          //                         ),
                          //                         Text(
                          //                           '0 of 50',
                          //                           style: Theme
                          //                               .of(context)
                          //                               .textTheme
                          //                               .headline6,
                          //                         ),
                          //                         Text(
                          //                           'REPS',
                          //                           style: Theme
                          //                               .of(context)
                          //                               .textTheme
                          //                               .headline6,
                          //                         ),
                          //                       ]),
                          //                 ),
                          //               ),
                          //               SizedBox(width: 2),
                          //               Expanded(
                          //                 child: Container(
                          //                   decoration: BoxDecoration(
                          //                     borderRadius: BorderRadius.only(
                          //                       topRight: Radius.circular(15),
                          //                       bottomRight:
                          //                       Radius.circular(15),
                          //                     ),
                          //                     color: Color(0xFF53ABCF),
                          //                   ),
                          //                   child: Column(
                          //                       mainAxisAlignment:
                          //                       MainAxisAlignment
                          //                           .spaceEvenly,
                          //                       crossAxisAlignment:
                          //                       CrossAxisAlignment.center,
                          //                       children: [
                          //                         Text(
                          //                           "EARN",
                          //                           style: Theme
                          //                               .of(context)
                          //                               .textTheme
                          //                               .bodyText2,
                          //                         ),
                          //                         Row(
                          //                           mainAxisAlignment:
                          //                           MainAxisAlignment
                          //                               .center,
                          //                           children: [
                          //                             Image.asset(
                          //                               'assets/images/bot.png',
                          //                               height: 27,
                          //                               width: 27,
                          //                             ),
                          //                             SizedBox(width: 10),
                          //                             Text(
                          //                               '10',
                          //                               style: Theme
                          //                                   .of(context)
                          //                                   .textTheme
                          //                                   .headline6,
                          //                             )
                          //                           ],
                          //                         ),
                          //                         Text(
                          //                           'COINS',
                          //                           style: Theme
                          //                               .of(context)
                          //                               .textTheme
                          //                               .headline6,
                          //                         )
                          //                       ]),
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // ),
                          // TODO:Hide the notification when trial expires.
                          Expanded(
                            child: Container(
                              child: ListView.builder(
                                  itemCount: dots.length ~/ 12 + 1,
                                  itemBuilder: (BuildContext context,
                                      int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30.0),
                                      child: Stack(
                                        overflow: Overflow.visible,
                                        children: thinkaboutlater(index),
                                      ),
                                    );
                                  }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Stack(
                  overflow: Overflow.visible,
                  children: [Padding(
                    padding: const EdgeInsets.fromLTRB(6.0, 5.0, 0.0, 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                          onPressed: null,
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/bot.png',
                                height: 27,
                                width: 27,
                              ),
                              Text('Journey')
                            ],
                          ),
                        ),
                        FlatButton(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/bot.png',
                                  height: 27,
                                  width: 27,
                                ),
                                Text('Rewards')
                              ],
                            ),
                            onPressed: null),
                        Spacer(),
                        FlatButton(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/bot.png',
                                  height: 27,
                                  width: 27,
                                ),
                                Text('Challenges')
                              ],
                            ),
                            onPressed: null),
                        FlatButton(
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/bot.png',
                                  height: 27,
                                  width: 27,
                                ),
                                Text('Profile')
                              ],
                            ),
                            onPressed: null),
                      ],
                    ),
                  ),
                    Positioned(
                      bottom: 20,
                      child: SizedBox(
                        width: width,
                        child: Center(
                          child: RawMaterialButton(
                              fillColor: Colors.white,
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(4.0),
                              child: Image.asset(
                                "assets/images/Group 433@2x.png", height: 70,
                                width: 70,
                                fit: BoxFit.fill,),
                              onPressed: null),
                        ),
                      ),
                    ),
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDots(double left, double right, double size, String img,) {
    double wunit = MediaQuery
        .of(context)
        .size
        .width / 6 - size / 2;
    double hunit = 300 / 12 - size / 2;
    return Positioned(
      left: left * wunit,
      top: right * hunit,
      child: GestureDetector(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Color(0xFFF4F4F4),
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'assets/images/' + img,
          ),
        ),
        onTap: () {
          // setState(() {});
        },
      ),
    );
  }

  String weekly = 'inactiveStar.png';
  String daily = 'lock.png';
  String levelUp = 'levelUp.png';
  String doingDot = 'doingDot.png';

  List<Widget> thinkaboutlater(int index) {
    // List<List<double>> twoDList = [[]];
    // // List.generate(
    // //     12, (i) => List(2), growable: false);
    //
    // twoDList[0] = [-0.25, 0];
    // twoDList[1] = [0.3, 2.5];
    // twoDList[2] = [1.3, 3.7];
    // twoDList[3] = [2.5, 4.0];
    // twoDList[4] = [3.65, 4.3];
    // twoDList[5] = [4.6, 5.4];
    // twoDList[6] = [5.05, 7.6];
    // twoDList[7] = [4.6, 9.5];
    // twoDList[8] = [3.65, 10.6];
    // twoDList[9] = [2.5, 10.9];
    // twoDList[10] = [1.3, 11.2];
    // twoDList[11] = [0.3, 12.5];
    index = 12 * index;
    double dotSize;
    String img;
    int k = index % 12;
    List<Widget> widgetList = [];
    widgetList.add(SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: 250,
      child: CustomPaint(
        painter: PathPainter(),
      ),
    ),);
    for (int j = 0; j < 12; j++) {
      if (dots[index].dotType == Type.DAILY) {
        dotSize = 20;
        img = 'lock.png';
      } else if (dots[index].dotType == Type.WEEKLY) {
        dotSize = 30;
        img = 'star.png';
      } else if (dots[index].dotType == Type.TIER) {
        dotSize = 30;
        img = 'star.png';
      }
      index ++;
      widgetList.add(buildDots(2.5,2.5, dotSize, img));
    // }
  }
    print(widgetList.length);
return widgetList;


}}



