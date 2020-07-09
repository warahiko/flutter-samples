import 'package:flutter/material.dart';

class FadeTransitionSample extends StatefulWidget {
  @override
  _FadeTransitionSampleState createState() => _FadeTransitionSampleState();
}

class _FadeTransitionSampleState extends State<FadeTransitionSample>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  Animation<double> _animation1;
  Animation<double> _animation2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = _controller.drive(
      Tween(
        begin: 0.0,
        end: 1.0,
      ),
    );
    _animation1 = _controller
        .drive(CurveTween(
          curve: Interval(
            0.0,
            0.6,
            curve: Curves.fastOutSlowIn,
          ),
        ))
        .drive(
          Tween(
            begin: 1,
            end: 0,
          ),
        );
    _animation2 = _controller
        .drive(CurveTween(
          curve: Interval(
            0.4,
            1.0,
            curve: Curves.fastOutSlowIn,
          ),
        ))
        .drive(
          Tween(
            begin: 0,
            end: 1,
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
          'FadeTransition sample',
          style: textTheme.headline6,
        ),
      ),
      body: Column(
        children: <Widget>[
          FadeTransition(
            opacity: _animation,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.lime,
            ),
          ),
          Stack(
            children: <Widget>[
              FadeTransition(
                opacity: _animation1,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.cyan,
                ),
              ),
              FadeTransition(
                opacity: _animation2,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.amber,
                ),
              ),
            ],
          ),
        ],
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
