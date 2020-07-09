import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'camera_screen.dart';
import 'items_list.dart';

class ItemsListScreen extends StatelessWidget {
  const ItemsListScreen({Key key, this.camera}) : super(key: key);

  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Items'),
      ),
      body: ItemsList(firestore: Firestore.instance),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CameraScreen(camera)),
            );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}