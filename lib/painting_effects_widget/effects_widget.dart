import 'dart:math';

import 'package:flutter/material.dart';

class EffectsSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Effects sample",
          style: textTheme.headline6,
        ),
      ),
      body: ListView(
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.lime,
            ),
            position: DecorationPosition.foreground,
            child: Container(
              height: 100,
              color: Colors.cyan,
            ),
          ),
          Container(
            height: 150,
            color: Colors.green,
            alignment: Alignment.center,
            child: Opacity(
              opacity: 0.5,
              child: Container(
                height: 50,
                color: Colors.red,
              ),
            ),
          ),
          Container(
            color: Colors.black,
            alignment: Alignment.center,
            child: ClipOval(
              child: Image.asset(
                "images/yoshi.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            color: Colors.black,
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              child: Image.asset(
                "images/yoshi.png",
                fit: BoxFit.fill,
              ),
            ),
            transform: Matrix4.rotationZ(pi / 8),
          ),
        ],
      ),
    );
  }
}
