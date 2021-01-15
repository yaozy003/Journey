import 'package:journey/Pages/ChallengesPage.dart';
import 'package:journey/Pages/JourneyPage.dart';
import 'package:journey/Pages/ProfilePage.dart';
import 'package:journey/Pages/WorkOutPage.dart';
import 'package:journey/Pages/RewardsPage.dart';
import 'package:journey/models/map_dots.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

const double bottomBarHeight = 60;
const double appBarPercentage = 0.04;
const double excludAappBarHeightPercentage = 0.96;

//动态组件
class NavigatorPage extends StatefulWidget {
  NavigatorPage();

  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  PageController _pageController = PageController();
  int _currentIndex = 3;

  //Dots
  static List<Dot> _dots = [];
  static int originalDotsAmount = 0;
  static Dot currentLockDot;
  static bool journeySelected = false,
      rewardsSelected = false,
      challengesSelected = false,
      profileSelected = false,
      workOutSelected = true;

  Future<List<Dot>> loadJsonDataUsingFuture() async {
    String jsonString = await rootBundle.loadString('assets/journeyMap.json');
    Map<String, dynamic> data = json.decode(jsonString);
    return MapDots.fromJson(data).dots;
  }

  void findCurrentLockDot() {
    for (int j = 0; j < _dots.length; j++) {
      if (_dots[j].status == Status.CURRENT_LOCK) {
        currentLockDot = _dots[j];
        break;
      }
    }
  }

  void _makeUpDots(){
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
  }

  void initState() {
    super.initState();

    this.loadJsonDataUsingFuture().then((d) => setState(() {
      _dots = d;
      _makeUpDots();
    }));

    //监听控制器滑动变化,改变底部tap
    _pageController.addListener(() {
      setState(() {
        _currentIndex = (_pageController.page).round();
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; //screen width
    double height = MediaQuery.of(context).size.height; //screen height

    return Scaffold(
      body: _currentPage(),
      bottomNavigationBar: SizedBox(
          height: bottomBarHeight,
          width: width,
          child: ButtomBar(context)),
    );
  }

  Stack ButtomBar(BuildContext context) {
    return Stack(overflow: Overflow.visible, children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Column(
                  children: [
                    journeySelected
                        ? Image.asset(
                      'assets/images/BottomNavi/journey_active.png',
                      height: 24.22,
                      width: 24.22,
                    )
                        : Image.asset(
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
                  setState(() {
                    journeySelected = true;
                    rewardsSelected = false;
                    challengesSelected = false;
                    profileSelected = false;
                    workOutSelected = false;
                    _currentIndex = 1;
                  });
                  _pageController.jumpToPage(1);
                }),
            FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Column(
                  children: [
                    rewardsSelected
                        ? Image.asset(
                      'assets/images/BottomNavi/rewards_active.png',
                      height: 24.22,
                      width: 24.22,
                    )
                        : Image.asset(
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
                  setState(() {
                    journeySelected = false;
                    rewardsSelected = true;
                    challengesSelected = false;
                    profileSelected = false;
                    workOutSelected = false;
                    _currentIndex = 2;
                  });
                  _pageController.jumpToPage(2);
                }),
            Spacer(),
            FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Column(
                  children: [
                    challengesSelected
                        ? Image.asset(
                      'assets/images/BottomNavi/challenges_active.png',
                      height: 24.22,
                      width: 24.22,
                    )
                        : Image.asset(
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
                  setState(() {
                    journeySelected = false;
                    rewardsSelected = false;
                    challengesSelected = true;
                    profileSelected = false;
                    workOutSelected = false;
                    _currentIndex = 3;
                  });
                  _pageController.jumpToPage(3);
                }),
            FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Column(
                  children: [
                    profileSelected
                        ? Image.asset(
                      'assets/images/BottomNavi/profile_active.png',
                      height: 24.22,
                      width: 24.22,
                    )
                        : Image.asset(
                      'assets/images/BottomNavi/profile_inactive.png',
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
                  setState(() {
                    journeySelected = false;
                    rewardsSelected = false;
                    challengesSelected = false;
                    profileSelected = true;
                    workOutSelected = false;
                    _currentIndex = 4;
                  });
                  _pageController.jumpToPage(4);
                }),
          ],
        ),
      ),
      Positioned(
        bottom: 20,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: RawMaterialButton(
                fillColor: Colors.white,
                shape: CircleBorder(),
                padding: EdgeInsets.all(4.0),
                child: workOutSelected
                    ? Image.asset(
                  'assets/images/BottomNavi/workout_active@2x.png',
                  height: 70,
                  width: 70,
                )
                    : Image.asset(
                  'assets/images/BottomNavi/workout_inactive@2x.png',
                  height: 70,
                  width: 70,
                ),
                onPressed: () {
                  setState(() {
                    journeySelected = false;
                    rewardsSelected = false;
                    challengesSelected = false;
                    profileSelected = false;
                    workOutSelected = true;
                    _currentIndex = 0;
                  });
                  _pageController.jumpToPage(0);
                }),
          ),
        ),
      ),
    ]);
  }

  //底部对应 页面
  Widget _currentPage() {
    List _pages = [
      WorkoutPage(),
      JourneyPage(_dots, currentLockDot, originalDotsAmount),
      RewardsPage(), //下面可自定义页面组件
      ChallengesPage(),
      ProfilePage(),
    ];
    return PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: _pages.length,
        controller: _pageController, //控制器
        itemBuilder: (context, index) => _pages[index] //构建一个页面实例
    );
  }
}
