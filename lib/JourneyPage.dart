import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:journey/PathPainter.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:journey/models/map_dots.dart';

class JourneyPage extends StatefulWidget {
  JourneyPage();

  @override
  _JourneyPageState createState() => _JourneyPageState();
}

class _JourneyPageState extends State<JourneyPage>
    with SingleTickerProviderStateMixin {
  List<Dot> _dots = [];
  Dot currentLockDot =
      Dot(reps: 0, reward: [Reward(rewardType: Type.DAILY, amount: "0.0")]);
  int originalDotsAmount = 0;
  int _widgetIndex = 0;

  //Animation Controller & Tween for dots.
  AnimationController _animationController;
  Animation<double> _doubleAnim;

  Future<List<Dot>> loadJsonDataUsingFuture() async {
    String jsonString = await rootBundle.loadString('assets/journeyMap.json');
    Map<String, dynamic> data = json.decode(jsonString);
    return MapDots.fromJson(data).dots;
  }

  @override
  void initState() {
    super.initState();
    this.loadJsonDataUsingFuture().then((d) => setState(() {
          _dots = d;
          originalDotsAmount = _dots.length;
          //make dots amount is multiples of 12
          int makeUpAmount = 12 - (_dots.length % 12);
          for (int i = 0; i < makeUpAmount; i++) {
            _dots.add(Dot(dotType: Type.MAKEUP));
          }
          if (_dots != null) {
            findCurrentLockDot();
          } else {
            print("dots are null");
          }
        }));

    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 2000,
        ),
        value: 1.0);
    _doubleAnim = Tween(begin: 0.9, end: 1.10).animate(_animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          //动画在结束时停止的状态
          _animationController.reverse(); //颠倒
        } else if (status == AnimationStatus.dismissed) {
          //动画在开始时就停止的状态
          _animationController.forward(); //向前
        }
      });
    _animationController.forward();
  }

  void dispose() {

    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("rebuild");
    double width = MediaQuery.of(context).size.width; //screen width
    double height = MediaQuery.of(context).size.height; //screen height

    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          //resizeToAvoidBottomPadding:true,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(height * 0.08),
            child: AppBar(
              title: Text(
                'JOURNEY',
                style: Theme.of(context).textTheme.headline1,
              ),
              bottom: PreferredSize(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 15.0),
                    child: ToggleSwitch(
                      minWidth: 170.0,
                      minHeight: 33.0,
                      fontSize: 14.0,
                      initialLabelIndex: _widgetIndex,
                      cornerRadius: 24.0,
                      activeBgColor: Colors.blue,
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.white,
                      inactiveFgColor: Colors.grey,
                      labels: ['Journey Map', 'Activity'],
                      onToggle: (index) {
                        setState(() {
                          _widgetIndex = index;
                          print(_widgetIndex);
                        });
                        //TODO:linked to another page.
                      },
                    ),
                  ),
                ]),
              ),
              //toggle switch,
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0, //remove shadow.
            ),
          ),
          body: Column(
            children: [
              //试用通知
              _widgetIndex == 0
                  ? Expanded(
                      child: SingleChildScrollView(
                          child:
                              Column(mainAxisSize: MainAxisSize.max, children: [
                        Container(
                          color: Colors.blue,
                          width: width,
                          height: 230,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                //notification rect
                                width: width,
                                height: 28,
                                color: Colors.blue,
                                margin: EdgeInsets.only(top: 10),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          16.0, 10, 16.0, 0),
                                      child: const Image(
                                        image: AssetImage(
                                          'assets/images/Badge.png',
                                        ),
                                      ),
                                    ),
                                    Column(
                                      //put two text on the top
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          '{2} MORE GOALS TO EARN YOUR \$10 BONUS!',
                                          textAlign: TextAlign.left,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        ),
                                        Text(
                                          'You have {3} days left of your free trial.',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xFF0A87BB),
                                ),
                                //Today's Goal

                                height: height * 0.18,
                                //Goal's box height
                                margin: EdgeInsets.all(15),
                                width: width,
                                child: Column(
                                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                        flex: 3,
                                        child: Center(
                                          child: Text(
                                            "TODAY'S GOAL",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                            textAlign: TextAlign.center,
                                          ),
                                        )), //TODO:style
                                    Expanded(
                                      flex: 6,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10,
                                            top: 0,
                                            right: 10,
                                            bottom: 10),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    bottomLeft:
                                                        Radius.circular(15),
                                                  ),
                                                  color: Color(0xFF53ABCF),
                                                ),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        "COMPLETED",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText2,
                                                      ),
                                                      Text(
                                                        currentLockDot.reps
                                                                .toString() +
                                                            ' of ' +
                                                            currentLockDot.reps
                                                                .toString(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline6,
                                                      ),
                                                      Text(
                                                        'REPS',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline6,
                                                      ),
                                                    ]),
                                              ),
                                            ),
                                            SizedBox(width: 2),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(15),
                                                    bottomRight:
                                                        Radius.circular(15),
                                                  ),
                                                  color: Color(0xFF53ABCF),
                                                ),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "EARN",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText2,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            'assets/images/bot.png',
                                                            height: 27,
                                                            width: 27,
                                                          ),
                                                          SizedBox(width: 10),
                                                          Text(
                                                            (double.parse(currentLockDot
                                                                        .reward[
                                                                            0]
                                                                        .amount) *
                                                                    100)
                                                                .round()
                                                                .toString(),
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline6,
                                                          )
                                                        ],
                                                      ),
                                                      Text(
                                                        'COINS',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline6,
                                                      )
                                                    ]),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              //TODO:Hide the notification when trial expires.
                            ],
                          ),
                        ),
                        Container(
                          height: height * 3.5,
                          color: Colors.blue,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _dots.length ~/ 12,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  30,
                                  15,
                                  30,
                                  0,
                                ),
                                child: Stack(
                                  overflow: Overflow.visible,
                                  children: thinkaboutlater(index),
                                ),
                              );
                            },
                          ),
                        ),
                      ])),
                    )
                  : Container(
                      height: 100,
                      child: Text(
                        "Helo",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
              Stack(overflow: Overflow.visible, children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(6.0, 5.0, 0.0, 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/BottomNavi/journey_inactive.png',
                                height: 24.22,
                                width: 24.22,
                              ),
                              Text(
                                'Journey',
                                style: Theme.of(context).textTheme.headline3,
                              )
                            ],
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/HomePage');
                          }),
                      FlatButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/BottomNavi/rewards_inactive.png',
                                height: 24.22,
                                width: 24.22,
                              ),
                              Text(
                                'Rewards',
                                style: Theme.of(context).textTheme.headline3,
                              )
                            ],
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/rewardsPage');
                          }),
                      Spacer(),
                      FlatButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/BottomNavi/challenges_inactive.png',
                                height: 24.22,
                                width: 24.22,
                              ),
                              Text(
                                'Challenges',
                                style: Theme.of(context).textTheme.headline3,
                              )
                            ],
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/challengesPage');
                          }),
                      FlatButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/BottomNavi/profile_active.png',
                                height: 24.22,
                                width: 24.22,
                              ),
                              Text(
                                'Profile',
                                style: Theme.of(context).textTheme.headline3,
                              )
                            ],
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/profilePage');
                          }),
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
                            "assets/images/BottomNavi/workout_inactive@2x.png",
                            height: 70,
                            width: 70,
                            fit: BoxFit.fill,
                          ),
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/HomePage');
                          }),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
      //Activity Page
    );
  }

  Widget buildDots(
    double left,
    double right,
    double size,
    String img,
    Dot dot,
  ) {
    double wunit = MediaQuery.of(context).size.width / 6;
    double hunit = 300 / 12;
    return Positioned(
      left: left * wunit - size / 2,
      top: right * hunit - size / 2,
      child: GestureDetector(
        child:
            // dot.status == Status.CURRENT_LOCK
            // ? Container(
            //     decoration: BoxDecoration(
            //       color: Color(0xFFF4F4F4),
            //       shape: BoxShape.circle,
            //     ),
            //     child: ScaleTransition(
            //       scale: _doubleAnim,
            //       child: Image.asset(
            //         'assets/images/' + img,
            //         width: size,
            //         height: size,
            //       ),
            //     ),
            //   )
            // :
            Container(
          decoration: BoxDecoration(
            color: Color(0xFFF4F4F4),
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'assets/images/' + img,
            width: size,
            height: size,
          ),
        ),
        onTap: () {
          showDialog<void>(
            context: context,
            barrierDismissible: true, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                contentPadding: EdgeInsets.all(16.0),
                title: Text(
                  "Today's goal",
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ), //Alertbox title
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF53ABCF),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'COMPLETE',
                                  style: Theme.of(context).textTheme.headline2,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  dot.reps.toString() + ' REPS',
                                  style: Theme.of(context).textTheme.headline2,
                                  textAlign: TextAlign.center,
                                )
                              ],
                            )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF53ABCF),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'EARN',
                                  style: Theme.of(context).textTheme.headline2,
                                  textAlign: TextAlign.center,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/bot@2x.png',
                                      height: 20,
                                      width: 20,
                                    ),
                                    Text(
                                      (double.parse(dot.reward[0].amount) * 100)
                                              .round()
                                              .toString() +
                                          ' Coins',
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    RawMaterialButton(
                        fillColor: Colors.blue,
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0)),
                        constraints: BoxConstraints.expand(
                            width: double.infinity, height: 30),
                        onPressed: null,
                        child: Text(
                          "SELECT WORKOUT",
                          style: Theme.of(context).textTheme.headline1,
                        )),
                    RawMaterialButton(
                      fillColor: Colors.grey,
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0)),
                      constraints: BoxConstraints.expand(
                          width: double.infinity, height: 30),
                      onPressed: null,
                      child: Text(
                        "I'll DO IT LATER",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget buildText(
    bool first,
    String text,
  ) {
    return Positioned(
      right: first ? null : 40,
      left: first ? 50 : null,
      top: first ? -15 : 110,
      child: Container(
        width: 300,
        height: 30,
        alignment: first ? Alignment.centerLeft : Alignment.centerRight,
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.rectangle,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }

  List<Widget> thinkaboutlater(int index) {
    List<List> twoDList = List.generate(12, (_) => new List(2));
    twoDList[0] = [-0.05, 0.0];
    twoDList[1] = [0.4, 2.15];
    twoDList[2] = [1.3, 2.85];
    twoDList[3] = [2.2, 3.05];
    twoDList[4] = [3.3, 3.2];
    twoDList[5] = [4.2, 3.4];
    twoDList[6] = [5.1, 4.9];
    twoDList[7] = [4.3, 6.6];
    twoDList[8] = [3.3, 6.7];
    twoDList[9] = [2.2, 6.85];
    twoDList[10] = [1.2, 7.15];
    twoDList[11] = [0.3, 8.0];
    index = 12 * index;
    double dotSize;
    String img;
    List<Widget> widgetList = [];
    widgetList.add(
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 250,
        child: CustomPaint(
          painter: PathPainter(_dots, index, originalDotsAmount),
        ),
      ),
    );
    bool first = true;
    if (index < originalDotsAmount) {
      for (int j = 0; j < 12; j++) {
        Dot dot = _dots[index];
        if (dot.dotType == Type.DAILY) {
          dotSize = 30;
          switch (dot.status) {
            case Status.LOCK:
              {
                img = 'lock.png';
              }
              break;
            case Status.TICK:
              {
                img = 'tick.png';
              }
              break;
            case Status.CURRENT_LOCK:
              {
                img = 'doingDot.png';

                dotSize = _doubleAnim.value * 30;
              }
              break;
            case Status.UNDONE:
              {
                img = 'cross.png';
              }
              break;
          }
        } else if (dot.dotType == Type.WEEKLY) {
          widgetList.add(buildText(first, dot.body));
          first = !first;
          dotSize = 43;

          switch (dot.status) {
            case Status.TICK:
              {
                img = 'activeStar.png';
              }
              break;
            case Status.CURRENT_LOCK:
              {
                img = 'doingDot.png';
                dotSize = _doubleAnim.value * dotSize;
              }
              break;
            case Status.LOCK:
              {
                img = 'inactiveStar.png';
              }
              break;
            case Status.UNDONE:
              {
                img = 'cross.png';
              }
              break;
          }
        } else if (dot.dotType == Type.TIER) {
          widgetList.add(buildText(first, dot.body));
          first = !first;
          dotSize = 50;
          switch (dot.status) {
            case Status.TICK:
              {
                img = 'tier_active.png';
              }
              break;
            case Status.CURRENT_LOCK:
              {
                img = 'doingDot.png';
                dotSize = _doubleAnim.value * dotSize;
              }
              break;
            case Status.LOCK:
              {
                img = 'tier_inactive.png';
              }
              break;
            case Status.UNDONE:
              {
                img = 'cross.png';
              }
              break;
            default:
              {
                img = 'cross.png';
              }
          }
        } else if (dot.dotType == Type.MAKEUP) {
          break;
        }
        index++;
        widgetList
            .add(buildDots(twoDList[j][0], twoDList[j][1], dotSize, img, dot));
        // }
      }
    }
    return widgetList;
  }

  void findCurrentLockDot() {
    for (int j = 0; j < _dots.length; j++) {
      if (_dots[j].status == Status.CURRENT_LOCK) {
        currentLockDot = _dots[j];
        break;
      }
    }
  }
}
