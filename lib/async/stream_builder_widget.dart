import 'package:flutter/material.dart';

class StreamBuilderSample extends StatelessWidget {
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
          StreamBuilder(
            stream: Repository().fetch(),
            builder: builder,
          ),
          StreamBuilder(
            stream: Repository().error(),
            builder: builder,
          ),
          StreamBuilder(
            stream: Repository().empty(),
            builder: builder,
          )
        ],
      ),
    );
  }
}

class Repository {
  Stream<int> fetch() {
    return Stream.fromFuture(
        Future.delayed(Duration(seconds: 2)).then((value) => 1));
  }

  Stream<int> error() {
    return Stream.fromFuture(
        Future.delayed(Duration(seconds: 2), () => Future.error(Error())));
  }

  Stream<int> empty() {
    return Stream.fromFuture(
        Future.delayed(Duration(seconds: 2)).then((value) => null));
  }
}
