import 'dart:ui';

import 'package:custompainter2/config/palette.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';

class BackgroudPainter extends CustomPainter {
  final Paint lightGreenPaint;
  final Paint blackPaint;

  final Animation animation;
  // final Animation singUpAnimation;

  final int _action;

  BackgroudPainter({Animation<double> animation, int action})
      : _action = action ?? 0,
        lightGreenPaint = Paint()
          ..color = Palette.lightGreen
          ..style = PaintingStyle.fill,
        blackPaint = Paint()
          ..color = Palette.black
          ..style = PaintingStyle.fill,
        animation = Tween(begin: 0, end: pi).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.elasticOut,
            reverseCurve: Curves.bounceInOut)),
        /*ldaAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.elasticOut,
            reverseCurve: Curves.bounceIn),*/
        super(repaint: animation) {
    print('${this.hashCode}......');
  }

  @override
  void paint(Canvas canvas, Size size) {
    // if (_action == 0) {
    //   _paintVivaz(canvas, size);
    //   _paintLda(canvas, size);
    // } else {
    //   _paintLda(canvas, size);
    //   _paintVivaz(canvas, size);
    // }
    _paintUpperRightShape(canvas, size, blackPaint);
    _paintUpperLeftShape(canvas, size, blackPaint);
    _paintUpperCenterShape(canvas, size, lightGreenPaint);
    _paintLeftButtomShape(canvas, size, lightGreenPaint);
    _paintRightButtomShape(canvas, size, blackPaint);
    //_paintLda(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void _paintUpperRightShape(Canvas canvas, Size size, Paint paint) {
    final w = size.width;
    final h = size.height;
    Path path = Path();
    path.moveTo(w, 0);
    path.lineTo(w, 0.22 * h);
    path.quadraticBezierTo(w - 0.15 * w, 0.20 * h, w - 0.30 * w, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  void _paintUpperLeftShape(Canvas canvas, Size size, Paint paint) {
    final w = size.width;
    final h = size.height;
    canvas.drawCircle(Offset(-w / 10, 0), 0.30 * h, paint);
  }

  void _paintUpperCenterShape(Canvas canvas, Size size, Paint paint) {
    final w = size.width;
    final h = size.height;
    Path path = Path();
    path.moveTo(w - 0.15 * w, 0);
    path.quadraticBezierTo(
        0.45 * w, 0.35 * h + sin(animation.value) * 0.05 * h, 0, 0.10 * h);
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  void _paintLeftButtomShape(Canvas canvas, Size size, Paint paint) {
    final w = size.width;
    final h = size.height;
    double radius = h / 40;
    canvas.drawCircle(Offset(0, h - 2 * h / 40 - 10), radius, paint);
  }

  void _paintRightButtomShape(Canvas canvas, Size size, Paint paint) {
    final w = size.width;
    final h = size.height;
    double radius = h / 10;
    canvas.drawCircle(Offset(w + 10, h + 10), radius, paint);
  }
}
