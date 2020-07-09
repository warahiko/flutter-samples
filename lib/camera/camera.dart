import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CameraSample extends StatefulWidget {
  final CameraDescription camera;

  const CameraSample({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  _CameraSampleState createState() => _CameraSampleState();
}

class _CameraSampleState extends State<CameraSample> {
  var isTaken = false;
  String path;

  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Camera sample',
          style: textTheme.headline6,
        ),
      ),
      body: isTaken
          ? Container(
              color: Colors.cyan,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 50,
                    color: Colors.lime,
                    alignment: Alignment.center,
                    child: Text(
                      'Taken picture',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Image.file(
                      File(path),
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
            )
          : FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_controller);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
      floatingActionButton: isTaken
          ? null
          : FloatingActionButton(
              child: Icon(Icons.camera_alt),
              onPressed: () async {
                try {
                  await _initializeControllerFuture;

                  path = join(
                    (await getTemporaryDirectory()).path,
                    '${DateTime.now()}.png',
                  );

                  await _controller.takePicture(path);

                  setState(() {
                    isTaken = true;
                  });
                } catch (e) {
                  print(e);
                }
              },
            ),
    );
  }
}
