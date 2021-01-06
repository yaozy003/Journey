import 'package:flutter/material.dart';

import 'package:journey/Navigator.dart';

const buttonTextStyle =
TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w700);
const repsStyle =
TextStyle(fontSize: 14.0, color: Colors.blue, fontWeight: FontWeight.w300);
const titleStyle =
TextStyle(fontSize: 18.0, color: Colors.blue, fontWeight: FontWeight.w700);
const workoutsItemStyle =
TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w300);
bool Premium = false;



class WorkoutPage extends StatefulWidget {
  WorkoutPage();

  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {

  @override
  Widget build(BuildContext context) {
    List<hWorkoutItem> hWorkouts = [
      hWorkoutItem("assets/images/BottomNavi/workout_active@2x.png", "WARM UP",
          ["10x STAR JUMP", "10x Squat", "10x Lunge"]),
      hWorkoutItem(
          "assets/images/BottomNavi/workout_active@2x.png",
          "GLUTES WORKOUT",
          ["15x Squat", "10x Squat Jump", "10x Lunge", "10x Knee Tuck Jump"]),
      hWorkoutItem(
          "assets/images/BottomNavi/workout_active@2x.png",
          "CORE WORKOUT",
          ["10x Squat", "10x Squat Jump", "20x High Knees", "20x STAR JUMP"]),
      hWorkoutItem(
          "assets/images/BottomNavi/workout_active@2x.png", "LEGS WORKOUT", [
        "10x Squat Jump",
        "20x High Knees",
        "20x Star Jump",
        "10x Knee Tuck Jump"
      ]),
    ];

    List<vWorkoutItem> vWorkouts = [
      vWorkoutItem(
          'assets/images/BottomNavi/workout_active@2x.png', 'STAR JUMP'),
      vWorkoutItem('assets/images/BottomNavi/workout_active@2x.png', 'LUNGE'),
      vWorkoutItem(
          'assets/images/BottomNavi/workout_active@2x.png', 'SQUAT JUMP'),
      vWorkoutItem(
          'assets/images/BottomNavi/workout_active@2x.png', 'KNEE TUCK JUMP'),
      vWorkoutItem(
          'assets/images/BottomNavi/workout_active@2x.png', 'HIGH KNEES'),
      vWorkoutItem(
          'assets/images/BottomNavi/workout_active@2x.png', 'TRICEPS DEPS'),
      vWorkoutItem(
          'assets/images/BottomNavi/workout_active@2x.png', 'ARM CIRCLE'),
      vWorkoutItem('assets/images/BottomNavi/workout_active@2x.png', 'PUSH UP'),
      vWorkoutItem(
          'assets/images/BottomNavi/workout_active@2x.png', 'INCH WORM'),
      vWorkoutItem('assets/images/BottomNavi/workout_active@2x.png',
          'LUNGE WITH KNEE RAISE'),
    ];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          SizedBox(height: height * 0.04,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "WORKOUTS",
                style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
              Image.asset('assets/images/WorkOutPageImages/workOutBOt@2x.png',height: 80,width: 80,)
            ],
          ),
          horizontalListView(height: height, width: width, workouts: hWorkouts),
          verticalListView(height: height, width: width, workouts: vWorkouts),
        ],
      ),
    );
  }
}


class verticalListView extends StatelessWidget {
  const verticalListView({
    Key key,
    @required this.height,
    @required this.width,
    @required this.workouts,
  }) : super(key: key);

  final double height;
  final double width;
  final List<vWorkoutItem> workouts;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: workouts.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: height * 0.1,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  margin: const EdgeInsets.all(6),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          workouts[index].image,
                          width: 60,
                          height: 60,
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              workouts[index].title,
                              style: titleStyle,
                            ),
                            Row(
                              children: [
                                reps(numberofReps: 10),
                                reps(numberofReps: 20),
                                reps(numberofReps: 30),
                                reps(numberofReps: 40),
                                reps(numberofReps: 50),
                              ],
                            )
                          ]),
                    ],
                  )),
            );
          }),
    );
  }
}

class reps extends StatelessWidget {
  const reps({
    Key key,
    @required this.numberofReps,
  }) : super(key: key);

  final int numberofReps;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      height: 40,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          child: Center(
              child: Text(
                numberofReps.toString(),
                style: workoutsItemStyle,
              )),
          color: Colors.blue.withOpacity(0.3),
        ),
      ),
    );
  }
}

class horizontalListView extends StatelessWidget {
  const horizontalListView({
    Key key,
    @required this.height,
    @required this.width,
    @required this.workouts,
  }) : super(key: key);

  final double height;
  final double width;
  final List<hWorkoutItem> workouts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.3,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: workouts.length,
          itemBuilder: (BuildContext context, int index) {
            List<Widget> widgetList = [];
            widgetList.add(Text(
              workouts[index].title,
              style: titleStyle,
            ));
            widgetList.addAll(workouts[index]
                .workoutList
                .map((e) => Row(
              children: [
                Text(
                  e,
                  style: workoutsItemStyle,
                ),
              ],
            ))
                .toList());
            return SizedBox(
              width: width * 0.6,
              child: Container(
                  margin: EdgeInsets.all(9.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          workouts[index].image,
                          width: 60,
                          height: 60,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: widgetList),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          height: 32,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              'QUICK START',
                              style: buttonTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            );
          }),
    );
  }
}

class hWorkoutItem {
  String image, title;
  List<String> workoutList;

  hWorkoutItem(this.image, this.title, this.workoutList);
}

class vWorkoutItem {
  String image, title;

  vWorkoutItem(this.image, this.title);
}
