import 'package:flutter/material.dart';

class ColumnRowSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Column/Row sample",
          style: textTheme.headline6,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.cyan,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                myContainer(),
                myContainer(),
                myContainer(),
              ],
            ),
          ),
          Container(
            color: Colors.lime,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                myContainer(),
                myContainer(),
                myContainer(),
              ],
            ),
          ),
          Container(
            color: Colors.cyan,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                myContainer(),
                myContainer(size: 100),
                myContainer(),
              ],
            ),
          ),
          Container(
            color: Colors.lime,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                myContainer(),
                Expanded(
                  child: myContainer(),
                ),
                Spacer(
                  flex: 2,
                ),
                Expanded(
                  child: myContainer(),
                  flex: 2,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.cyan,
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.spaceEvenly,
              children: <Widget>[
                myContainer(label: "1"),
                myContainer(label: "2"),
                myContainer(label: "3"),
                myContainer(label: "4"),
                myContainer(label: "5"),
                myContainer(label: "6"),
                myContainer(label: "7"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container myContainer({double size = 50, String label = ""}) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: size,
      height: size,
      color: Colors.black,
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
