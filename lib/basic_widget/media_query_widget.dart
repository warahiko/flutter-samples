import 'package:flutter/material.dart';

class MediaQuerySample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final mediaQuery = MediaQuery.of(context);
    final text = mediaQuery.orientation == Orientation.landscape
        ? 'Landscape!!'
        : 'portrait!!';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MediaQuery sample',
          style: textTheme.headline6,
        ),
      ),
      body: Container(
        color: Colors.cyan,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
