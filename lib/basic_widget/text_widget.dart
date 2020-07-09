import 'package:flutter/material.dart';

class TextWidgetSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final styleSample =
        textTheme.bodyText1.copyWith(backgroundColor: Colors.lime);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Text/RichText sample',
          style: textTheme.headline6,
        ),
      ),
      body: ListView(
        children: <Widget>[
          const Text("text"),
          const Text(
            "text text text text text text text text text text text text text text text text text text",
            overflow: TextOverflow.ellipsis,
          ),
          const Text(
            "text",
            textAlign: TextAlign.center,
          ),
          const Text(
            "text",
            style: TextStyle(fontSize: 96),
          ),
          const Text(
            "text",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text.rich(TextSpan(
            text: "This ",
            style: TextStyle(fontSize: 24),
            children: [
              TextSpan(
                  text: "is ", style: TextStyle(fontStyle: FontStyle.italic)),
              TextSpan(
                  text: "a ", style: TextStyle(backgroundColor: Colors.cyan)),
              TextSpan(text: "sample.", style: TextStyle(color: Colors.red))
            ],
          )),
          Text(
            "flutter sample",
            style: styleSample,
          ),
        ],
      ),
    );
  }
}
