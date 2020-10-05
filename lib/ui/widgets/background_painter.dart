import 'dart:ui';

import 'package:custompainter2/config/palette.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/rendering.dart';

class BackgroudPainter extends CustomPainter {
  final Paint vivazPaint;
  final Paint ldaPaint;
  final Paint aprecioPaint;
  final Animation vivazAnimation;
  final Animation ldaAnimation;

  BackgroudPainter({Animation<double> animation})
      : vivazPaint = Paint()
          ..color = Palette.vivaz
          ..style = PaintingStyle.fill,
        ldaPaint = Paint()
          ..color = Palette.lda
          ..style = PaintingStyle.fill,
        aprecioPaint = Paint()
          ..color = Palette.aprecio
          ..style = PaintingStyle.fill,
        vivazAnimation =
            CurvedAnimation(parent: animation, curve: Curves.elasticOut),
        ldaAnimation = CurvedAnimation(
            parent: animation,
            curve: Interval(0.2, 1.0, curve: Curves.elasticOut)),
        super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    _paintVivaz(canvas, size);
    _paintLda(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void _paintVivaz(Canvas canvas, Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;
    path.moveTo(w, h / 2);
    path.lineTo(w, 0);
    path.lineTo(0, 0);
    path.cubicTo(
        lerpDouble(w / 4, 0, vivazAnimation.value),
        lerpDouble(h / 16, h / 8, vivazAnimation.value),
        lerpDouble(3 * w / 4, w, vivazAnimation.value),
        lerpDouble(3 * h / 8, h / 8, vivazAnimation.value),
        w,
        h / 4);
    path.close();
    canvas.drawPath(path, vivazPaint);
  }

  void _paintLda(Canvas canvas, Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;
    path.moveTo(w / 2, 0);
    path.lineTo(0, 0);
    path.lineTo(0, h / 3);
    path.quadraticBezierTo(lerpDouble(0, w / 2, ldaAnimation.value),
        lerpDouble(0, h / 3, ldaAnimation.value), w / 2, 0);
    path.close();
    canvas.drawPath(path, ldaPaint);
  }
}
