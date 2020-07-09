import 'package:flutter/material.dart';
import 'package:flutter_samples/ui/toast.dart';

class PageViewSample extends StatelessWidget {
  final items = [
    container(),
    container(color: Colors.lime),
    container(color: Colors.cyan),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ScrollView sample',
          style: textTheme.headline6,
        ),
      ),
      body: PageView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => items[index],
        controller: PageController(initialPage: 1),
        onPageChanged: (page) {
          MyToast(
            context,
            text: 'page: $page',
          ).show();
        },
      ),
    );
  }

  static Widget container({Color color = Colors.black}) {
    return Container(
      height: 500,
      margin: EdgeInsets.all(32.0),
      color: color,
    );
  }
}
