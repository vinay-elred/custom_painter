import 'package:flutter/material.dart';

class CustomMvp3 extends CustomPainter {
  const CustomMvp3({
    this.color,
    this.text1,
    this.textStyle1,
    this.text2,
    this.textStyle2,
  });
  final Color? color;
  final String? text1;
  final TextStyle? textStyle1;
  final String? text2;
  final TextStyle? textStyle2;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ?? Colors.red
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;

    final width = size.width;
    final height = size.height;

    final path = Path();

    //draw a bottom rrect
    final pointA = Offset(0, height * 0.1);
    final pointB = Offset(width, height);
    final rect = Rect.fromPoints(pointA, pointB);
    final rRect = RRect.fromRectAndRadius(rect, const Radius.circular(20));
    path.addRRect(rRect);

    //draw a top rrect
    final pointA1 = Offset(width * 0.05, 0);
    final pointB1 = Offset(width * 0.4, height * 0.17);
    final rect2 = Rect.fromPoints(pointA1, pointB1);
    final rRect2 = RRect.fromRectAndRadius(rect2, const Radius.circular(100));
    path.addRRect(rRect2);

    // Close the path
    path.close();
    canvas.drawPath(path, paint);

    // Add to top text
    final textSpan = TextSpan(
      text: text1 ?? 'Looking for',
      style: textStyle1 ?? const TextStyle(color: Colors.white, fontSize: 13),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      maxLines: 1,
      ellipsis: '...',
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: width * 0.3,
    );
    final xCenter = (width * 0.45 - textPainter.width) / 2;
    final yCenter = (height * 0.18 - textPainter.height) / 2;
    final offset = Offset(xCenter, yCenter);
    textPainter.paint(canvas, offset);

    // Add to desc text
    final textSpan2 = TextSpan(
      text: text2 ?? 'Description ',
      style: textStyle2 ?? const TextStyle(color: Colors.white, fontSize: 20),
    );
    final textPainter2 = TextPainter(
      text: textSpan2,
      textDirection: TextDirection.ltr,
      ellipsis: '...',
      maxLines: 3,
    );
    textPainter2.layout(
      minWidth: 0,
      maxWidth: width * 0.9,
    );
    final xCenter2 = width * 0.05;
    final yCenter2 = height * 0.25;
    final offset2 = Offset(xCenter2, yCenter2);
    textPainter2.paint(canvas, offset2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
