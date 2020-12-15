//TODO：根据json数据 画好断开的虚线。
import 'package:flutter/material.dart';
import 'models/map_dots.dart';
import 'package:path_drawing/path_drawing.dart';

class PathPainter extends CustomPainter {
  final List<Dot> dots;
  final int index;

  PathPainter(this.dots, this.index);

  List<Point> dotPoints = [];
  double x0, y0, x1, y1, x2, y2, x3, y3;

  @override
  void paint(Canvas canvas, Size size) {
    int count = index;
    double wunit = size.width / 6;
    double hunit = size.height / 12;
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14.0;

    Paint dashPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14.0;
    Path path = Path();
    //
    dotPoints.add(Point(-0.1 * wunit, 0)); //1
    dotPoints.add(Point(0.1 * wunit, 1.8 * hunit)); //control point 0.5
    dotPoints.add(Point(0.6 * wunit, 2.9 * hunit)); //1

    dotPoints.add(Point(0.6 * wunit, 2.9 * hunit)); //1
    dotPoints.add(Point(0.7 * wunit, 3.2 * hunit)); //control point 1.5
    dotPoints.add(Point(1.4 * wunit, 3.4 * hunit)); //2

    dotPoints.add(Point(1.4 * wunit, 3.5 * hunit)); //2
    dotPoints.add(Point(1.4 * wunit, 3.4 * hunit)); //control point 2.5
    dotPoints.add(Point(2.6 * wunit, 3.7 * hunit)); //3
    //
    dotPoints.add(Point(2.6 * wunit, 3.7 * hunit)); //3
    dotPoints.add(Point(3 * wunit, 3.8 * hunit)); //control point 3.5
    dotPoints.add(Point(3.8 * wunit, 3.8 * hunit)); //4

    dotPoints.add(Point(3.8 * wunit, 3.8 * hunit)); //4
    dotPoints.add(Point(4.5 * wunit, 3.7 * hunit)); //control point 4.5
    dotPoints.add(Point(5.0 * wunit, 4.1 * hunit)); //5

    dotPoints.add(Point(5.0 * wunit, 4.1 * hunit)); //5
    dotPoints.add(Point(6 * wunit, 4.6 * hunit)); //control point 5.5
    dotPoints.add(Point(6 * wunit, 6 * hunit)); //6

    dotPoints.add(Point(6 * wunit, 6 * hunit)); //6
    dotPoints.add(Point(6 * wunit, 7.8 * hunit)); //control point 6.5
    dotPoints.add(Point(5.0 * wunit, 7.9 * hunit)); //7

    dotPoints.add(Point(5.0 * wunit, 7.9 * hunit)); //7
    dotPoints.add(Point(4.5 * wunit, 8.0 * hunit)); //control point 7.5
    dotPoints.add(Point(4 * wunit, 8 * hunit)); //8

    dotPoints.add(Point(4 * wunit, 8 * hunit)); //8
    dotPoints.add(Point(3.5 * wunit, 8.2 * hunit)); //control point 8.5
    dotPoints.add(Point(2.8 * wunit, 8.2 * hunit)); //9

    dotPoints.add(Point(2.8 * wunit, 8.4 * hunit)); //9
    dotPoints.add(Point(2.3 * wunit, 8.0 * hunit)); //control point 9.5
    dotPoints.add(Point(1.6 * wunit, 8.4 * hunit)); //10

    dotPoints.add(Point(1.6 * wunit, 8.5 * hunit)); //10
    dotPoints.add(Point(0.7 * wunit, 8.8 * hunit)); //control point 10.5
    dotPoints.add(Point(0.45 * wunit, 9.6 * hunit)); //11

    dotPoints.add(Point(0.45 * wunit, 9.1 * hunit)); //11
    dotPoints.add(Point(0.1 * wunit, 10.2 * hunit)); //control point 11.5
    dotPoints.add(Point(-0.1 * wunit, 12.4 * hunit)); //12

//find index
    int temp = 0;
    bool found = false;
    for (int j = 0; j < dots.length; j++) {
      if (dots[j].status == Status.CURRENT_LOCK) {
        found = true;
      }
      if (found && dots[j].dotType == Type.WEEKLY) {
        temp = j;
        break;
      }
    }

    for (int i = 0; i < dotPoints.length; i++) {
      if (i % 3 == 0) {
        x0 = dotPoints[i].x;
        y0 = dotPoints[i].y;
      } else if (i % 3 == 1) {
        x1 = dotPoints[i].x;
        y1 = dotPoints[i].y;
      } else if (i % 3 == 2) {
        x2 = dotPoints[i].x;
        y2 = dotPoints[i].y;
        path.moveTo(x0, y0);
        path.quadraticBezierTo(
          x1,
          y1,
          x2,
          y2,
        );
        Path p = Path()
          ..moveTo(10.0, 10.0)
          ..lineTo(100.0, 100.0)
          ..quadraticBezierTo(125.0, 20.0, 200.0, 100.0);

        if (count < dots.length  &&
            dots[count].status == Status.UNDONE) {
          print("helo");
          canvas.drawPath(
              dashPath(
                path,
                dashArray: CircularIntervalList<double>(
                  <double>[5.0, 2.5],
                ),
              ),
              paint);
        }else {
          canvas.drawPath(path, paint);
        }
      }
      //if (count < dots.length) {
      //   if(count < 52){
      //     canvas.drawPath(path, paint);
      //   } else {
      //     canvas.drawPath(path, dashPaint);
      //   }
      //   count ++;
      // }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class Point {
  double x;
  double y;

  Point(double x, double y) {
    this.x = x;
    this.y = y;
  }
}
