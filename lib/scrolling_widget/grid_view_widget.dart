import 'package:flutter/material.dart';

class GridViewSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GridView sample',
          style: textTheme.headline6,
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8,
          crossAxisSpacing: 16,
          crossAxisCount: 3,
          childAspectRatio: 2,
        ),
        primary: false,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(32),
        itemCount: 50,
        itemBuilder: (context, index) => view(index.toString()),
      ),
    );
  }

  Container view(String text) {
    return Container(
      color: Colors.cyan,
      height: 100,
      width: 100,
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
