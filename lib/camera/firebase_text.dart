import 'dart:io';

import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class FirebaseText extends StatefulWidget {
  final CameraDescription camera;

  const FirebaseText({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  _FirebaseTextState createState() => _FirebaseTextState();
}

class _FirebaseTextState extends State<FirebaseText> {
  var _isTaken = false;
  String _path;

  CameraController _controller;
  Future<void> _initializeControllerFuture;

  final TextRecognizer _textRecognizer =
      FirebaseVision.instance.textRecognizer();
  List<TextBlock> _currentTextBlocks = [];

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
    _textRecognizer.close();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TextRecognizing',
          style: textTheme.headline6,
        ),
      ),
      body: _isTaken ? buildResultWidget() : buildCameraWidget(),
      floatingActionButton: _isTaken ? null : buildFloatingActionButton(),
    );
  }

  Widget buildFloatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.camera_alt),
      onPressed: () async {
        try {
          await _initializeControllerFuture;

          _path = join(
            (await getTemporaryDirectory()).path,
            '${DateTime.now()}.png',
          );

          await _controller.takePicture(_path);
          final currentLabels = await analyze();

          setState(() {
            _currentTextBlocks = currentLabels;
            _isTaken = true;
          });
        } catch (e) {
          print(e);
        }
      },
    );
  }

  Widget buildCameraWidget() {
    return FutureBuilder<void>(
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
    );
  }

  Widget buildResultWidget() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          buildImage(),
          Expanded(
            child: buildImageList(),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    return Container(
      width: 300,
      alignment: Alignment.center,
      child: Image.file(
        File(_path),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget buildImageList() {
    Widget child;
    if (_currentTextBlocks.length == 0) {
      child = Text(
        'No Results',
        style: TextStyle(color: Colors.white, fontSize: 32),
      );
    } else {
      child = ListView.builder(
        padding: const EdgeInsets.all(4.0),
        itemCount: _currentTextBlocks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              'Text: ${_currentTextBlocks[index].text}',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          );
        },
      );
    }

    return Container(
      color: Colors.cyan,
      alignment: Alignment.center,
      child: child,
    );
  }

  Future<List<TextBlock>> analyze() async {
    try {
      final FirebaseVisionImage visionImage =
          FirebaseVisionImage.fromFilePath(_path);
      final currentLabels = await _textRecognizer.processImage(visionImage);
      return currentLabels.blocks;
    } catch (e) {
      return Future.error(e);
    }
  }
}
