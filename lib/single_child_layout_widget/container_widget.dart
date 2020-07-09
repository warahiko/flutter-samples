import 'dart:math';

import 'package:flutter/material.dart';

class ContainerSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Container sample",
          style: textTheme.headline6,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            color: Colors.red,
            child: Container(
              color: Colors.green,
              width: 300,
              height: 300,
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.yellow,
            margin: EdgeInsets.all(12.0),
            padding: EdgeInsets.all(16.0),
            constraints: const BoxConstraints(maxHeight: 100),
            child: Container(
              color: Colors.cyan,
              width: 200,
              height: 200,
              transform: Matrix4.rotationZ(pi / 8),
            ),
          ),
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: Colors.black,
                width: 10.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
