import 'dart:math';

import 'package:flutter/material.dart';

class DraggableSample extends StatefulWidget {
  @override
  _DraggableSampleState createState() => _DraggableSampleState();
}

class _DraggableSampleState extends State<DraggableSample> {
  bool isSuccessful = false;

  final _random = Random();

  final _colors = [
    Colors.red.withAlpha(120),
    Colors.green.withAlpha(120),
    Colors.blue.withAlpha(120),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final _color = _colors[_random.nextInt(_colors.length)];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Draggable sample',
          style: textTheme.headline6,
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Draggable<Color>(
              data: _color,
              child: yoshi(size: 100.0, color: _color),
              feedback: yoshi(size: 150.0, color: _color),
              childWhenDragging:
                  yoshi(size: 100.0, color: Colors.grey.withAlpha(120)),
              onDraggableCanceled: (
                Velocity velocity,
                Offset offset,
              ) {
                setState(() {
                  isSuccessful = false;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            DragTarget(
              builder: (context, List<Color> candidateData, rejectedData) {
                return Center(
                  child: isSuccessful
                      ? Container(
                          color: Colors.black,
                          height: 100.0,
                          width: 100.0,
                          child: Center(
                            child: yoshi(
                                size: 100.0,
                                color: Colors.green.withAlpha(120)),
                          ),
                        )
                      : Container(
                          color: Colors.black,
                          height: 100.0,
                          width: 100.0,
                        ),
                );
              },
              onWillAccept: (Color data) {
                return data == Colors.green.withAlpha(120);
              },
              onAccept: (Color data) {
                setState(() {
                  isSuccessful = true;
                });
              },
              onLeave: print,
            )
          ],
        ),
      ),
    );
  }

  Widget yoshi({double size, Color color}) {
    return Image.asset(
      'images/yoshi.png',
      fit: BoxFit.fill,
      width: size,
      height: size,
      color: color,
    );
  }
}
