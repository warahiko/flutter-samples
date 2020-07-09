import 'package:flutter/material.dart';

class StackSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stack sample",
          style: textTheme.headline6,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 500,
            color: Colors.lime,
            child: Stack(
              children: <Widget>[
                box(),
                Positioned(
                  bottom: 150,
                  right: 80,
                  height: 75,
                  child: box(color: Color.fromARGB(200, 255, 0, 0)),
                ),
                Positioned(
                  top: 150,
                  left: 100,
                  width: 75,
                  child: box(color: Color.fromARGB(200, 0, 0, 255)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget box({Color color = Colors.black}) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: color,
      ),
    );
  }
}
