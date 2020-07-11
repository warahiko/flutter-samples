import 'dart:io';

import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class FirebaseBarcode extends StatefulWidget {
  final CameraDescription camera;

  const FirebaseBarcode({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  _FirebaseBarcodeState createState() => _FirebaseBarcodeState();
}

class _FirebaseBarcodeState extends State<FirebaseBarcode> {
  var _isTaken = false;
  String _path;

  CameraController _controller;
  Future<void> _initializeControllerFuture;

  final BarcodeDetector _barcodeDetector =
      FirebaseVision.instance.barcodeDetector();
  List<Barcode> _currentBarcodeLabels = [];

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
    _barcodeDetector.close();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BarcodeScanning',
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
            _currentBarcodeLabels = currentLabels;
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
            child: buildBarcodeList(),
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

  Widget buildBarcodeList() {
    Widget child;
    if (_currentBarcodeLabels.length == 0) {
      child = Text(
        'No Results',
        style: TextStyle(color: Colors.white, fontSize: 32),
      );
    } else {
      child = ListView.builder(
        padding: const EdgeInsets.all(4.0),
        itemCount: _currentBarcodeLabels.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              'Raw value: ${_currentBarcodeLabels[index].rawValue}',
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

  Future<List<Barcode>> analyze() async {
    try {
      final FirebaseVisionImage visionImage =
          FirebaseVisionImage.fromFilePath(_path);
      final currentLabels = await _barcodeDetector.detectInImage(visionImage);
      return currentLabels;
    } catch (e) {
      return Future.error(e);
    }
  }
}
