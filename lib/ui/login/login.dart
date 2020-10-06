import 'package:custompainter2/ui/widgets/background_painter.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  int _operativa = 0; //0 --> Register, 1 --> Login

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2500));

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
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: CustomPaint(
              painter: BackgroudPainter(
                  animation: _animationController.view, operativa: _operativa),
            ),
          ),
          Positioned(
            bottom: 20,
            child: RaisedButton(
                child: Text('Click...'),
                onPressed: () {
                  _animationController.forward(from: 0);
                  setState(() {
                    _operativa = _operativa == 0 ? 1 : 0;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
