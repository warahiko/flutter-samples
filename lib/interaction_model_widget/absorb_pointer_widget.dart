import 'package:flutter/material.dart';

class AbsorbPointerSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final showText = (text) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(text),
        duration: Duration(seconds: 1),
      ));
    };

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'AbsorbPointer sample',
          style: textTheme.headline6,
        ),
      ),
      body: Column(
        children: <Widget>[
          AbsorbPointer(
            absorbing: true,
            child: Container(
              height: 100,
              child: RaisedButton(
                child: Text('Button Absorbed'),
                onPressed: () => showText('press!'),
              ),
            ),
          ),
          Container(
            height: 100,
            child: RaisedButton(
              child: Text('Button'),
              onPressed: () => showText('press!'),
            ),
          )
        ],
      ),
    );
  }
}
