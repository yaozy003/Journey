import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

const double appBarPercentage = 0.04;
const double BannerADHeight = 52.0;
const coinsStyle =
    TextStyle(fontSize: 36.0, color: Colors.white, fontWeight: FontWeight.w700);
const audStyle =
    TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w300);

const progressTextStyle =
    TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w300);
const progressTextStyle1 =
    TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w700);

const buttonTextStyle =
    TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w700);

const itemNameTextStyle =
    TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w500);
const priceTextStyle =
    TextStyle(fontSize: 18.0, color: Colors.blue, fontWeight: FontWeight.w700);
const coinsTextStyle =
    TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w700);

List<StoreItem> storeItems = [
  StoreItem("assets/images/WorkOutPageImages/workOutBOt@2x.png",
      "MicroUSB to USB C Adaptor", 6.95, 6950),
  StoreItem("assets/images/WorkOutPageImages/workOutBOt@2x.png",
      "Jsersey Beanie", 22.95, 22950),
  StoreItem("assets/images/WorkOutPageImages/workOutBOt@2x.png", "Travel Mug",
      16.95, 16950),
  StoreItem("assets/images/WorkOutPageImages/workOutBOt@2x.png", "Lunch Bag",
      18.95, 18950),
  StoreItem("assets/images/WorkOutPageImages/workOutBOt@2x.png", "Face Mask",
      14.95, 14950),
  StoreItem("assets/images/WorkOutPageImages/workOutBOt@2x.png",
      "Fitbotic Phone Stand ", 3.95, 3950),
  StoreItem("assets/images/WorkOutPageImages/workOutBOt@2x.png", "Water Bottle",
      22.95, 22950),
  StoreItem("assets/images/WorkOutPageImages/workOutBOt@2x.png",
      "Women's Premium Hoodie", 42.95, 42950),
  StoreItem("assets/images/WorkOutPageImages/workOutBOt@2x.png",
      "Cotton Drawstring Bag", 17.95, 17950),
  StoreItem("assets/images/WorkOutPageImages/workOutBOt@2x.png",
      "Men's 50/50 T-Shirt", 22.95, 22950),
];

class StoreItem {
  String image, itemName;
  double price;
  int coins;

  StoreItem(this.image, this.itemName, this.price, this.coins);
}

class RewardsPage extends StatefulWidget {
  RewardsPage();

  @override
  _RewardsPageState createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  int _widgetIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var f = NumberFormat.compact();
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(height * appBarPercentage),
              child: AppBar(
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0, //remove shadow.
                title: Text(
                  "REWARDS",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
            body: Container(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                              icon: Icon(
                                                  Icons.info_outline_rounded),
                                              onPressed: () {
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
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0))),
                                          elevation: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                30.0, 10.0, 30.0, 10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(children: [
                                                  RotatedBox(
                                                    quarterTurns: 2,
                                                    child:
                                                        CircularPercentIndicator(
                                                      radius: 65.0,
                                                      lineWidth: 6.0,
                                                      animation: true,
                                                      animationDuration: 2000,
                                                      percent: 1 / 3,
                                                      center: RotatedBox(
                                                        quarterTurns: 2,
                                                        child: Text(
                                                          "1/3",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 10.0),
                                                        ),
                                                      ),
                                                      circularStrokeCap:
                                                          CircularStrokeCap
                                                              .round,
                                                      progressColor:
                                                          Colors.green,
                                                      backgroundColor: Colors
                                                          .grey
                                                          .withOpacity(0.3),
                                                    ),
                                                  ),
                                                  Text("Daily Goal",
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12.0)),
                                                ]),
                                                Column(children: [
                                                  RotatedBox(
                                                    quarterTurns: 2,
                                                    child:
                                                        CircularPercentIndicator(
                                                      radius: 65.0,
                                                      lineWidth: 6.0,
                                                      animation: true,
                                                      animationDuration: 2000,
                                                      percent: 1 / 4,
                                                      center: RotatedBox(
                                                        quarterTurns: 2,
                                                        child: Text(
                                                          "1/4",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 10.0),
                                                        ),
                                                      ),
                                                      circularStrokeCap:
                                                          CircularStrokeCap
                                                              .round,
                                                      progressColor:
                                                          Colors.yellow,
                                                      backgroundColor: Colors
                                                          .grey
                                                          .withOpacity(0.3),
                                                    ),
                                                  ),
                                                  Text("Weekly Goal",
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12.0)),
                                                ]),
                                                Column(
                                                  children: [
                                                    RotatedBox(
                                                      quarterTurns: 2,
                                                      child:
                                                          CircularPercentIndicator(
                                                        radius: 65.0,
                                                        lineWidth: 6.0,
                                                        animation: true,
                                                        animationDuration: 2000,
                                                        percent: 1 / 3,
                                                        center: RotatedBox(
                                                          quarterTurns: 2,
                                                          child: Text(
                                                            "1/3",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 10.0),
                                                          ),
                                                        ),
                                                        circularStrokeCap:
                                                            CircularStrokeCap
                                                                .round,
                                                        progressColor:
                                                            Colors.blue,
                                                        backgroundColor: Colors
                                                            .grey
                                                            .withOpacity(0.3),
                                                      ),
                                                    ),
                                                    Text("Current Tier",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12.0)),
                                                  ],
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
                                          "Spend your discounted code on the Fitbotic Store",
                                          style: progressTextStyle,
                                        ),
                                      ]),
                                ),
                              ),
                              GridView.count(
                                  padding: EdgeInsets.symmetric(horizontal: 3),
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 9,
                                  crossAxisSpacing: 5,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  children: storeItems
                                      .map((e) => Stack(
                                              overflow: Overflow.visible,
                                              children: [
                                                Container(
                                                  child: Card(
                                                    elevation: 2,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            e.image,
                                                            width: 90,
                                                            height: 90,
                                                          ),
                                                          Text(
                                                            e.itemName,
                                                            style:
                                                                itemNameTextStyle,
                                                            softWrap: false,
                                                          ),
                                                          Text(
                                                            "\$" +
                                                                e.price
                                                                    .toString(),
                                                            style:
                                                                priceTextStyle,
                                                            softWrap: false,
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.3),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16),
                                                            ),
                                                            height: 32,
                                                            width:
                                                                double.infinity,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Image.asset(
                                                                  "assets/images/JourneyPageImages/bot.png",
                                                                  width: 16,
                                                                  height: 16,
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Text(
                                                                  NumberFormat(
                                                                              '###,000',
                                                                              'en_US')
                                                                          .format(
                                                                              e.coins) +
                                                                      " Coins",
                                                                  style:
                                                                      coinsTextStyle,
                                                                  softWrap:
                                                                      false,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                    bottom: -10,
                                                    right: 10,
                                                    child: GestureDetector(
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: Colors.blue,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(24),
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(6.0),
                                                          child: Image.asset(
                                                            "assets/images/RewardsPageImages/arrow-left@2x.png",
                                                            width: 20,
                                                            height: 20,
                                                          ),
                                                        ),
                                                      ),
                                                        onTap: _gotoShoppingPage

                                                    ))
                                              ]))
                                      .toList()),
                            ],
                          ),
                        )
                      : Expanded(child: Container())
                ],
              ),
            )),
      ),
    );
  }
  _gotoShoppingPage() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
