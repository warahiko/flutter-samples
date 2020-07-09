import 'dart:developer';

import 'package:flutter/material.dart';

class ScrollControllerSample extends StatefulWidget {
  @override
  _ScrollControllerSampleState createState() => _ScrollControllerSampleState();
}

class _ScrollControllerSampleState extends State<ScrollControllerSample> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      log("scroll");
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    log("build");

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ScrollController sample',
          style: textTheme.headline6,
        ),
      ),
      body: ListView.builder(
          controller: _controller,
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('$index'),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _controller.jumpTo(_controller.position.maxScrollExtent);
        },
      ),
    );
  }
}
