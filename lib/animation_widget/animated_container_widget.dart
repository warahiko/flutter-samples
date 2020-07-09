import 'package:flutter/material.dart';

class AnimatedContainerSample extends StatefulWidget {
  @override
  _AnimatedContainerSampleState createState() =>
      _AnimatedContainerSampleState();
}

class _AnimatedContainerSampleState extends State<AnimatedContainerSample> {
  var _color = Colors.red;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AnimatedContainer sample',
          style: textTheme.headline6,
        ),
      ),
      body: AnimatedContainer(
        duration: Duration(seconds: 5),
        color: _color,
        child: const SizedBox(
          height: 300,
          width: 300,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _color = Colors.green;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
