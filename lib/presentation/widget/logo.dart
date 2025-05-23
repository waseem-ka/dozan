import 'package:flutter/material.dart';

class SpinningImageLoader extends StatefulWidget {
  @override
  _SpinningImageLoaderState createState() => _SpinningImageLoaderState();
}

class _SpinningImageLoaderState extends State<SpinningImageLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(); // دوران مستمر
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Image.asset('assets/images/Logo.png', width: 50, height: 50),
    );
  }
}
