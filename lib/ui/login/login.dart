import 'package:custompainter2/ui/widgets/background_painter.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation delayedAnimationRegister;
  Animation delayedAnimationLogin;
  int _action = 0; //0 --> Register, 1 --> Login

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

    delayedAnimationRegister = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.1, curve: Curves.fastOutSlowIn)));

    delayedAnimationLogin = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.1, curve: Curves.fastOutSlowIn)));

    WidgetsBinding.instance
        .addPostFrameCallback((_) => _animationController.forward(from: 0.0));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: CustomPaint(
              painter: BackgroudPainter(
                  animation: _animationController.view, action: _action),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 150,
            child: RaisedButton(
                child: Text('Click...'),
                onPressed: () {
                  _animationController.forward(from: 0);
                  setState(() {});
                }),
          ),
        ],
      ),
    );
  }
}
