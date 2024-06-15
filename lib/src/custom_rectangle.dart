import 'package:flutter/material.dart';

class CustomShapeRRectangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    final width = size.width;
    final height = size.height;

    //** Draw a rectangle */
    final center = Offset(width / 2, height / 2);
    final rect = Rect.fromCenter(center: center, width: width, height: height);
    final rRect = RRect.fromRectXY(rect, 5, 5);
    canvas.drawRRect(rRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
