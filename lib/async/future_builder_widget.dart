import 'package:flutter/material.dart';

class FutureBuilderSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final builder = (context, snapshot) {
      if (snapshot.connectionState != ConnectionState.done) {
        return Container(
          height: 100,
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        );
      }
      if (snapshot.hasError) {
        return Container(
          height: 100,
          alignment: Alignment.center,
          child: Text('Error'),
        );
      }
      if (!snapshot.hasData) {
        return Container(
          height: 100,
          alignment: Alignment.center,
          child: Text('Empty'),
        );
      }
      return Container(
        height: 100,
        alignment: Alignment.center,
        child: Text('data : ${snapshot.data}'),
      );
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FutureBuilder sample',
          style: textTheme.headline6,
        ),
      ),
      body: Column(
        children: <Widget>[
          FutureBuilder(
            future: Repository().fetch(),
            builder: builder,
          ),
          FutureBuilder(
            future: Repository().error(),
            builder: builder,
          ),
          FutureBuilder(
            future: Repository().empty(),
            builder: builder,
          )
        ],
      ),
    );
  }
}

class Repository {
  Future<int> fetch() {
    return Future.delayed(Duration(seconds: 2)).then((value) => 1);
  }

  Future<int> error() {
    return Future.delayed(Duration(seconds: 2), () => Future.error(Error()));
  }

  Future<int> empty() {
    return Future.delayed(Duration(seconds: 2)).then((value) => null);
  }
}
