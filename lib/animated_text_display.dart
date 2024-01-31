import 'package:flutter/material.dart';

class AnimatedTextDisplay extends StatefulWidget {
  @override
  _AnimatedTextDisplayState createState() => _AnimatedTextDisplayState();
}

class _AnimatedTextDisplayState extends State<AnimatedTextDisplay>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );

    _animation =
        IntTween(begin: 0, end: "EXPLORIGMA".length).animate(_controller)
          ..addListener(() {
            setState(() {}); //yeh har baar animation frames to load karega
          });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    String displayText = "EXPLORIGMA".substring(0, _animation.value);
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Text(
          displayText,
          style: TextStyle(
            color: Colors.green,
            fontSize: 40.0,
            letterSpacing: 10.0,
            fontFamily: "Digital",
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
