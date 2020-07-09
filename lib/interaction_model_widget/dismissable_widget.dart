import 'package:flutter/material.dart';

class DismissibleSample extends StatefulWidget {
  @override
  _DismissibleSampleState createState() => _DismissibleSampleState();
}

class _DismissibleSampleState extends State<DismissibleSample> {
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
          'Dismissible sample',
          style: textTheme.headline6,
        ),
      ),
      body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.cyan,
              ),
              secondaryBackground: Container(
                color: Colors.lime,
              ),
              child: ListTile(
                title: Text('${_items[index]}'),
              ),
              confirmDismiss: (DismissDirection direction) async {
                return await showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const Text(
                          'Confirm',
                          style: TextStyle(color: Colors.blue),
                        ),
                        content: Text(
                            'Are you sure you wish to delete this item [${_items[index]}]?'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('cancel'),
                            onPressed: () => Navigator.of(context).pop(false),
                          ),
                          FlatButton(
                            child: Text('OK'),
                            onPressed: () => Navigator.of(context).pop(true),
                          ),
                        ],
                      );
                    });
              },
              onDismissed: (DismissDirection direction) {
                setState(() {
                  _items.removeAt(index);
                });
              },
            );
          }),
    );
  }
}
