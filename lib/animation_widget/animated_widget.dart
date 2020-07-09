import 'package:flutter/material.dart';

class AnimatedWidgetSample extends StatefulWidget {
  @override
  _AnimatedWidgetSampleState createState() => _AnimatedWidgetSampleState();
}

class _AnimatedWidgetSampleState extends State<AnimatedWidgetSample>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

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
          'AnimatedWidget sample',
          style: textTheme.headline6,
        ),
      ),
      body: AnimatedImage(
        animation: _animation,
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

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  final image = Image.asset('images/yoshi.png');

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        height: animation.value,
        width: animation.value,
        child: image,
      ),
    );
  }
}
