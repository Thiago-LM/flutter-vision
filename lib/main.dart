import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'items_list_screen.dart';

List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Fetch the available cameras before initializing the app.
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: ${e.code}\nError Message: ${e.description}');
  }
  runApp(FlutterVisionApp());
}

class FlutterVisionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ItemsListScreen(camera: cameras[0]),
    );
  }
}