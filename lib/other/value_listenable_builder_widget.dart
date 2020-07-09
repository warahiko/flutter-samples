import 'package:flutter/material.dart';

class ValueListenableBuilderSample extends StatefulWidget {
  @override
  _ValueListenableBuilderSampleState createState() =>
      _ValueListenableBuilderSampleState();
}

class _ValueListenableBuilderSampleState
    extends State<ValueListenableBuilderSample> {
  final _counter = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ValueListenableBuilder sample',
          style: textTheme.headline6,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('you have pushed the button this many times:'),
            ValueListenableBuilder<int>(
              valueListenable: _counter,
              builder: (context, count, child) {
                return Text(
                  '$count',
                  style: textTheme.headline1,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
        onPressed: () => _counter.value++,
      ),
    );
  }
}
