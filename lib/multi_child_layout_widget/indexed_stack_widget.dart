import 'package:flutter/material.dart';

class IndexedStackSample extends StatefulWidget {
  @override
  _IndexedStackSampleState createState() => _IndexedStackSampleState();
}

class _IndexedStackSampleState extends State<IndexedStackSample> {
  int _index = 0;

  void flip() {
    setState(() {
      _index = (_index + 1) % 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "IndexedStack sample",
          style: textTheme.headline6,
        ),
      ),
      body: MyIndexedStackView(index: _index),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.android),
        onPressed: () {
          flip();
        },
      ),
    );
  }
}

class MyIndexedStackView extends StatelessWidget {
  MyIndexedStackView({Key key, @required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: index,
      children: <Widget>[
        Container(
          color: Colors.lime,
        ),
        Container(
          color: Colors.cyan,
        )
      ],
    );
  }
}
