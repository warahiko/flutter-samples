import 'package:flutter/material.dart';

class TableSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Table sample',
          style: textTheme.headline6,
        ),
      ),
      body: DefaultTextStyle(
        textAlign: TextAlign.center,
        style: textTheme.bodyText1.copyWith(
          color: Colors.white,
        ),
        child: Table(
          border: TableBorder.all(),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(children: <Widget>[
              element(1, 1, height: 200.0),
              element(1, 2, color: Colors.lime),
              element(1, 3),
            ]),
            TableRow(children: <Widget>[
              element(2, 1, color: Colors.cyan),
              element(2, 2),
              element(2, 3, height: 300.0),
            ]),
          ],
        ),
      ),
    );
  }

  Widget element(int row, int col,
      {height = 50.0, Color color = Colors.black}) {
    return Container(
      margin: EdgeInsets.all(4),
      color: color,
      height: height,
      alignment: Alignment.center,
      child: Text("Row $row Col $col"),
    );
  }
}
