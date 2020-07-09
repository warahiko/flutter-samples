import 'package:flutter/material.dart';

class InkWellSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final showText = (text) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(text),
        duration: Duration(seconds: 1),
      ));
    };

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'InkWell sample',
          style: textTheme.headline6,
        ),
      ),
      body: ListView(
        children: <Widget>[
          InkWell(
            child: Container(
              height: 200,
              color: Colors.cyan,
              alignment: Alignment.center,
              child: const Text(
                'InkWell',
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () => showText('tap!'),
            onDoubleTap: () => showText('doubleTap!'),
            onLongPress: () => showText('longPress!'),
          ),
          GestureDetector(
            child: Container(
              height: 200,
              color: Colors.lime,
              alignment: Alignment.center,
              child: const Text(
                'GestureDetector',
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () => showText('tap!'),
            onDoubleTap: () => showText('doubleTap!'),
            onLongPress: () => showText('longPress!'),
            onHorizontalDragEnd: (param) => showText('horizontalDrag!'),
            onVerticalDragEnd: (param) => showText('verticalDrag!'),
          )
        ],
      ),
    );
  }
}
