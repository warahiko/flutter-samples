import 'package:flutter/material.dart';

class ScrollViewSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ScrollView sample',
          style: textTheme.headline6,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            container(),
            container(),
            container(),
          ],
        ),
      ),
    );
  }

  Widget container() {
    return Container(
      height: 500,
      margin: EdgeInsets.all(32.0),
      color: Colors.lime,
    );
  }
}
