import 'package:flutter/material.dart';

class AnimatedBuilderSample extends StatefulWidget {
  @override
  _AnimatedBuilderSampleState createState() => _AnimatedBuilderSampleState();
}

class _AnimatedBuilderSampleState extends State<AnimatedBuilderSample>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  final image = Image.asset('images/yoshi.png');

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animation = _controller.drive(
      Tween(
        begin: 0,
        end: 300,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AnimatedBuilder sample',
          style: textTheme.headline6,
        ),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              height: _animation.value,
              width: _animation.value,
              child: child,
            );
          },
          child: image,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _controller.forward();
        },
      ),
    );
  }
}
