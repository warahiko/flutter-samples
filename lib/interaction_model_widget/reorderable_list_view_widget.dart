import 'package:flutter/material.dart';

class ReorderableListViewSample extends StatefulWidget {
  @override
  _ReorderableListViewSampleState createState() =>
      _ReorderableListViewSampleState();
}

class _ReorderableListViewSampleState extends State<ReorderableListViewSample> {
  final _items = [
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ReorderableListView sample',
          style: textTheme.headline6,
        ),
      ),
      body: ReorderableListView(
        header: const Text('LongTap and Drag'),
        children: <Widget>[
          for (var item in _items)
            ListTile(
              key: ValueKey(item),
              title: Text(item.toString()),
            ),
        ],
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > _items.length) {
              newIndex = _items.length;
            }
            if (oldIndex < newIndex) {
              newIndex--;
            }
            var item = _items[oldIndex];
            _items.remove(item);
            _items.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
