import 'package:flutter/material.dart';

class ShapeLinha extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 10;

    double centerHeight = size.height / 2;

    canvas.drawLine(
        Offset(0, centerHeight), Offset(size.width, centerHeight), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
