import 'dart:math';

import 'package:flutter/material.dart';

class ClockCircleTicker extends StatelessWidget {
  const ClockCircleTicker(
      {Key? key, required this.seconds, required this.radius})
      : super(key: key);
  final int seconds;
  final double radius;
  @override
  Widget build(BuildContext context) {
    final color = seconds % 5 == 0
        ? Colors.lightGreenAccent[700]
        : Colors.deepOrange[900];
    const double width = 2;
    const double height = 12;
    return Transform(
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0.0)
        ..rotateZ(2 * pi * (seconds / 60.0))
        ..translate(0.0, radius - height / 2, 0.0),
      alignment: Alignment.center,
      child: Container(
        //  width: width,
//          decoration: BoxDecoration(
//            color: color,
//                 border: Border.all(width: width),
// shape: BoxShape.circle
//                 // borderRadius: BorderRadius.circular(radius)
//                 )
        // decoration: BoxDecoration,
        color: color,
        height: height,
        width: width,
      ),
    );
  }
}

class ClockTextMarker extends StatelessWidget {
  const ClockTextMarker(
      {Key? key,
      required this.value,
      required this.maxvalue,
      required this.radius})
      : super(key: key);
  final int value;
  final double maxvalue;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final double height = 40;
    final double width = 30;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0.0)
        ..rotateZ(pi + 2 * pi * (value / 60))
        ..translate(0.0, radius - 35, 0.0)
        ..rotateZ(pi - 2 * pi * (value / 60)),
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        child: Text(value.toString()),
      ),
    );
  }
}
