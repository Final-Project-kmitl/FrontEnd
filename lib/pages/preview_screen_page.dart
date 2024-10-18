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
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the captured image
            Image.file(File(picture.path), fit: BoxFit.cover),

            const SizedBox(height: 34),

            // Buttons for Retake and Store
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => onRetake(),
                    child: Container(
                        decoration: BoxDecoration(),
                        child: Text(
                          'ถ่ายใหม่',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(color: Colors.white),
                        )),
                  ),
                  GestureDetector(
                    onTap: () => onStore(),
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(1000)),
                        child: Text(
                          'เก็บภาพ',
                          style: Theme.of(context).textTheme.headlineLarge,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
