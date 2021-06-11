import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stopwatch_flutter/ui/mainScreen/widgets/clock_circle_ticker.dart';
import 'package:stopwatch_flutter/ui/mainScreen/widgets/handClock.dart';

import 'elapsed_time_text.dart';

class StopWatchRenderer extends StatelessWidget {
  const StopWatchRenderer({
    Key? key,
    required this.elapsed,
    required this.radius,
  }) : super(key: key);
  final Duration elapsed;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for(var i=0;i<60;i++)
        Positioned(
          top: radius,
          left: radius,
          child: ClockCircleTicker(seconds:i,radius:radius)),
          for(var i=5;i<=60;i+=5)
        Positioned(
          top: radius,
          left: radius,
          child: ClockTextMarker(value:i,radius:radius,maxvalue: 60,)),
        // Container(
        //     decoration: BoxDecoration(
        //         border: Border.all(width: 3, color: Colors.lightGreen),
        //         borderRadius: BorderRadius.circular(radius))),
        Positioned(
          right: 0,
          left: 0,
          top: radius * 1.3,
          child: ElapsedTimeText(
            elapsed: elapsed,
          ),
        ),
        Positioned(
          top: radius,
          left: radius,
          child: ClockHand(
              handLength: radius,
              handThickness: 2,
              rotationZAngle: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
              color: Colors.orange),
        )
      ],
    );
  }
}
