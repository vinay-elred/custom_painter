import 'package:flutter/material.dart';

class CustomShapeWave extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;

    final width = size.width;
    final height = size.height;

    //** Draw a Path */
    final path = Path();

    // Move to a starting point
    path.moveTo(0, height);

    // Draw a line to a point
    // path.lineTo(width, height);

    // Draw a quadratic Bézier curve
    final controlX = width * 0.35;
    final controlY = height * 0.25;
    path.quadraticBezierTo(controlX, controlY, width / 2, height);

    // Draw a cubic Bézier curve
    final controlX1 = width * 0.75;
    final controlY1 = height * 2;
    final controlX2 = width * .85;
    final controlY2 = height * 0.25;
    path.cubicTo(controlX1, controlY1, controlX2, controlY2, width, height);

    // Close the path
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}