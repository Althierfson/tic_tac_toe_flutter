import 'package:flutter/material.dart';

class ShapeCirculo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 7
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawOval(
        Rect.fromCenter(center: center, width: size.width, height: size.height),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
