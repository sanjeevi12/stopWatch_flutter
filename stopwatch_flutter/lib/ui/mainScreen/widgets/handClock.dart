import 'package:flutter/material.dart';

class ClockHand extends StatelessWidget {
  const ClockHand(
      {Key? key,
      required this.handLength,
      required this.handThickness,
      required this.rotationZAngle,
      required this.color})
      : super(key: key);
  final double handLength;
  final double handThickness;
  final double rotationZAngle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()..rotateZ(rotationZAngle),
      child: Container(
        width: handThickness,
        height: handLength,
        color: color,
        // child: child,
      ),
    );
  }
}

