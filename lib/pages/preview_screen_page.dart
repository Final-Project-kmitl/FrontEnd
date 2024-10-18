// preview_screen.dart
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class PreviewScreen extends StatelessWidget {
  final XFile picture;
  final Function onRetake;
  final Function onStore;

  const PreviewScreen({
    Key? key,
    required this.picture,
    required this.onRetake,
    required this.onStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Image'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display the captured image
          Image.file(File(picture.path), fit: BoxFit.cover),

          const SizedBox(height: 20),

          // Buttons for Retake and Store
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => onRetake(),
                child: const Text('Retake'),
              ),
              ElevatedButton(
                onPressed: () => onStore(),
                child: const Text('Store'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
