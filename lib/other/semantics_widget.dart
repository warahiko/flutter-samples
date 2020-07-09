import 'package:flutter/material.dart';

class SemanticsSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Semantics sample',
          style: textTheme.headline6,
        ),
      ),
      body: Container(
        height: 200,
        child: Semantics(
          child: Text('Flutter sample application.'),
          label: 'Flutter sample application.',
          enabled: true,
          readOnly: true,
        ),
      ),
    );
  }
}
