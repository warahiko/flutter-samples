import 'package:flutter/material.dart';

class SafeAreaSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SafeArea sample',
          style: textTheme.headline6,
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 1000,
          itemBuilder: (_, index) {
            return ListTile(
              title:
                  Text('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa$index'),
            );
          },
        ),
      ),
    );
  }
}
