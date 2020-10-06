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

  final int _operativa;

  BackgroudPainter({Animation<double> animation, int operativa})
      : _operativa = operativa ?? 0,
        vivazPaint = Paint()
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
        ldaAnimation =
            CurvedAnimation(parent: animation, curve: Curves.elasticOut),
        super(repaint: animation) {
    print('${this.hashCode}......');
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (_operativa == 0) {
      _paintVivaz(canvas, size);
      _paintLda(canvas, size);
    } else {
      _paintLda(canvas, size);
      _paintVivaz(canvas, size);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void _paintVivaz(Canvas canvas, Size size) {
    /*final path = Path();
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
    canvas.drawPath(path, vivazPaint);*/
    final w = size.width;
    final h = size.height;
    canvas.drawCircle(
        Offset(w, 0),
        lerpDouble(0, _operativa == 0 ? h / 8 : h / 2, vivazAnimation.value),
        vivazPaint);
  }

  void _paintLda(Canvas canvas, Size size) {
    /*final path = Path();
    final w = size.width;
    final h = size.height;
    path.moveTo(2 * w / 3, 0);
    path.lineTo(0, 0);
    path.lineTo(0, h / 3);
    path.quadraticBezierTo(lerpDouble(0, w / 2, ldaAnimation.value),
        lerpDouble(0, h / 3, ldaAnimation.value), 2 * w / 3, 0);
    path.close();
    canvas.drawPath(path, ldaPaint);*/
    final w = size.width;
    final h = size.height;
    canvas.drawCircle(
        Offset(0, 0),
        lerpDouble(0, _operativa == 0 ? h / 2 : h / 8, ldaAnimation.value),
        ldaPaint);
  }
}
