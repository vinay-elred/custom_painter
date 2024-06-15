import 'package:flutter/material.dart';

class CustomShapeCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    final width = size.width;
    final height = size.height;
    //** Draw a circle */
    final offset = Offset(width / 2, height / 2);
    canvas.drawCircle(offset, 50, paint);

    final path = Path();
    path.addOval(Rect.fromCircle(
      center: Offset(width / 2, height / 2),
      radius: 100,
    ));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
