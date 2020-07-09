import 'package:flutter/material.dart';

class ImageWidgetSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Image/Icon sample',
          style: textTheme.headline6,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset("images/yoshi.png"),
          Image.asset(
            "images/yoshi.png",
            fit: BoxFit.fill,
          ),
          Image.asset(
            "images/yoshi.png",
            centerSlice: Rect.fromLTWH(10, 100, 100, 50),
          ),
          Icon(
            Icons.access_alarm,
            color: Colors.orange,
            size: 24,
          )
        ],
      ),
    );
  }
}
