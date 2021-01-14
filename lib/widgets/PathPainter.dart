import 'package:flutter/material.dart';
import '../models/map_dots.dart';
import 'package:path_drawing/path_drawing.dart';

class PathPainter extends CustomPainter {
  final List<Dot> dots;
  int originalDotAmount;
  int index;
  PathPainter(this.dots, this.index, this.originalDotAmount);

bool called = false;
int i = 1;
  @override
  void paint(Canvas canvas, Size size) {

      List<Point> dotPoints = [];
      double x0, y0, x1, y1, x2, y2;

      double wUnit = size.width / 6;
      double hUnit = size.height / 12;
      Paint paint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 14.0;

      Paint dashPaint = Paint()
        ..color = Colors.white.withOpacity(0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 14.0;


        dotPoints.add(Point(-0.1 * wUnit, 0)); //1
        dotPoints.add(Point(0.1 * wUnit, 1.8 * hUnit)); //control point 0.5
        dotPoints.add(Point(0.6 * wUnit, 2.9 * hUnit)); //1

        dotPoints.add(Point(0.6 * wUnit, 2.9 * hUnit)); //1
        dotPoints.add(Point(0.7 * wUnit, 3.2 * hUnit)); //control point 1.5
        dotPoints.add(Point(1.4 * wUnit, 3.4 * hUnit)); //2

        dotPoints.add(Point(1.4 * wUnit, 3.5 * hUnit)); //2
        dotPoints.add(Point(1.4 * wUnit, 3.4 * hUnit)); //control point 2.5
        dotPoints.add(Point(2.6 * wUnit, 3.7 * hUnit)); //3
        //
        dotPoints.add(Point(2.6 * wUnit, 3.7 * hUnit)); //3
        dotPoints.add(Point(3 * wUnit, 3.8 * hUnit)); //control point 3.5
        dotPoints.add(Point(3.8 * wUnit, 3.8 * hUnit)); //4

        dotPoints.add(Point(3.8 * wUnit, 3.8 * hUnit)); //4
        dotPoints.add(Point(4.5 * wUnit, 3.7 * hUnit)); //control point 4.5
        dotPoints.add(Point(5.0 * wUnit, 4.1 * hUnit)); //5

        dotPoints.add(Point(5.0 * wUnit, 4.1 * hUnit)); //5
        dotPoints.add(Point(6 * wUnit, 4.6 * hUnit)); //control point 5.5
        dotPoints.add(Point(6 * wUnit, 6 * hUnit)); //6

        dotPoints.add(Point(6 * wUnit, 6 * hUnit)); //6
        dotPoints.add(Point(6 * wUnit, 7.8 * hUnit)); //control point 6.5
        dotPoints.add(Point(5.0 * wUnit, 7.9 * hUnit)); //7

        dotPoints.add(Point(5.0 * wUnit, 7.9 * hUnit)); //7
        dotPoints.add(Point(4.5 * wUnit, 8.0 * hUnit)); //control point 7.5
        dotPoints.add(Point(4 * wUnit, 8 * hUnit)); //8

        dotPoints.add(Point(4 * wUnit, 8 * hUnit)); //8
        dotPoints.add(Point(3.5 * wUnit, 8.2 * hUnit)); //control point 8.5
        dotPoints.add(Point(2.8 * wUnit, 8.2 * hUnit)); //9

        dotPoints.add(Point(2.8 * wUnit, 8.4 * hUnit)); //9
        dotPoints.add(Point(2.3 * wUnit, 8.0 * hUnit)); //control point 9.5
        dotPoints.add(Point(1.6 * wUnit, 8.4 * hUnit)); //10

        dotPoints.add(Point(1.6 * wUnit, 8.5 * hUnit)); //10
        dotPoints.add(Point(0.7 * wUnit, 8.8 * hUnit)); //control point 10.5
        dotPoints.add(Point(0.45 * wUnit, 9.6 * hUnit)); //11

        dotPoints.add(Point(0.45 * wUnit, 9.1 * hUnit)); //11
        dotPoints.add(Point(0.1 * wUnit, 10.2 * hUnit)); //control point 11.5
        dotPoints.add(Point(-0.1 * wUnit, 12.4 * hUnit)); //12

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
        Path path = Path();
        int remainder = i % 3;
        if (remainder == 0) {
          x0 = dotPoints[i].x;
          y0 = dotPoints[i].y;
        } else if (remainder == 1) {
          x1 = dotPoints[i].x;
          y1 = dotPoints[i].y;
        } else if (remainder == 2) {
          x2 = dotPoints[i].x;
          y2 = dotPoints[i].y;
          path.moveTo(x0, y0);
          path.quadraticBezierTo(
            x1,
            y1,
            x2,
            y2,
          );
          if (index < dots.length) {
            if (dots[index].status == Status.UNDONE ||
                dots[index].dotType == Type.MAKEUP ||
                index == originalDotAmount - 1) {
              print("虚线 $index");
              canvas.drawPath(
                //dashline
                  dashPath(
                    path,
                    dashArray: CircularIntervalList<double>(
                      <double>[5.0, 2.5],
                    ),
                  ),
                  paint);
             }
            else if (index < temp) {
              print("实线 $index");
              canvas.drawPath(path, paint);
            }
            else if (index >= temp) {
              print("透明 $index");
              canvas.drawPath(path, dashPaint);
            }
            index++;
          }
        }
      }
i++;
  }

    @override
    bool shouldRepaint(CustomPainter oldDelegate) => i == 2;

}

class Point {
  double x;
  double y;

  Point(double x, double y) {
    this.x = x;
    this.y = y;
  }
}
