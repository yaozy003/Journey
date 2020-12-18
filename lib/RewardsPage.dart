import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:percent_indicator/percent_indicator.dart';

const double BannerADHeight = 52.0;
const coinsStyle =
    TextStyle(fontSize: 36.0, color: Colors.white, fontWeight: FontWeight.w700);
const audStyle =
    TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w300);
const buttonTextStyle =
    TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w700);
const progressTextStyle =
    TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w300);
const progressTextStyle1 =
TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w700);

class RewardsPage extends StatefulWidget {
  RewardsPage();

  @override
  _RewardsPageState createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  int _widgetIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 8.0),
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
              labels: ['Fitbotic Rewards', 'Transactions'],
              onToggle: (index) {
                setState(() {
                  _widgetIndex = index;
                  print(_widgetIndex);
                });
              },
            ),
          ),
          SizedBox(
            height: BannerADHeight,
            width: double.infinity,
            child: Container(
              color: Colors.red,
              child: Text(
                "BANNER AD",
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          _widgetIndex == 0
              ? Expanded(
                  child: ListView(
                    children: <Widget>[
                      CoinsContainer(),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "YOUR PROGRESS",
                                      style: progressTextStyle1,
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.info_outline_rounded),
                                      onPressed: (){
                                        //TODO:info Button function.
                                      },
                                    )
                                  ],
                                ),
                                Text(
                                  "Complete all of your daily goals,4 weeks in a row to reach the next tier and earn more rewards!",
                                  style: progressTextStyle,
                                ),
                                Card(
                                shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.0))),
                                  elevation: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(30.0, 10.0,30.0,10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CircularPercentIndicator(
                                          radius: 56.0,
                                          lineWidth: 2.0,
                                          animation: true,
                                          animationDuration: 2000,
                                          percent: 1 / 3,
                                          center: Text(
                                            "1/3",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10.0),
                                          ),
                                          footer: Text(
                                            "Daily Goal",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12.0),
                                          ),
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                          progressColor: Colors.green,
                                        ),
                                        CircularPercentIndicator(
                                          radius: 56.0,
                                          lineWidth: 2.0,
                                          animation: true,
                                          animationDuration: 2000,
                                          percent: 1 / 4,
                                          center: Text(
                                            "1/4",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10.0),
                                          ),
                                          footer: Text(
                                            "Weekly Goal",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12.0),
                                          ),
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                          progressColor: Colors.yellow,
                                        ),
                                        CircularPercentIndicator(
                                          radius: 56.0,
                                          lineWidth: 2.0,
                                          animation: true,
                                          animationDuration: 2000,
                                          percent: 1 / 3,
                                          center: Text(
                                            "1/3",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10.0),
                                          ),
                                          footer: Text(
                                            "Current Tier",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12.0),
                                          ),
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                          progressColor: Colors.blue,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Text(
                                  "FITBOTIC STORE",
                                  style: progressTextStyle1,
                                ),
                                Text(
                                  "YOUR PROGRESS",
                                  style: progressTextStyle1,
                                ),
                              ]),
                        ),
                      ),
                      GridView.count(
                        crossAxisCount: 2,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: <Widget>[],
                      ),
                      // ...... other list children.
                    ],
                  ),
                )
              : Expanded(child: Container())
        ],
      ),
    );
  }
}

class CoinsContainer extends StatelessWidget {
  const CoinsContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(21),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/RewardsPageImages/rewards_bot.png",
                      width: 81,
                      height: 81,
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '0 Coins',
                          style: coinsStyle,
                        ),
                        Text(
                          'EQUAL TO \$0.00AUD',
                          style: audStyle,
                        )
                      ])
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 32,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'STORE DISCOUNT',
                    style: buttonTextStyle,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 32,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'CASH OUT',
                    style: buttonTextStyle,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
