import 'package:flutter/material.dart';

class AnimatedSwitcherSample extends StatefulWidget {
  @override
  _AnimatedSwitcherSampleState createState() => _AnimatedSwitcherSampleState();
}

class _AnimatedSwitcherSampleState extends State<AnimatedSwitcherSample> {
  var _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AnimatedSwitcher sample',
          style: textTheme.headline6,
        ),
      ),
      body: AnimatedSwitcher(
        duration: Duration(seconds: 5),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: _isVisible
            ? Container(
                height: 200,
                width: 200,
                color: Colors.lime,
              )
            : const SizedBox.shrink(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isVisible = true;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
