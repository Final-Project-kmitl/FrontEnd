import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:frontend/pages/preview_screen_page.dart';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:matcher/expect.dart';
import 'package:path_provider/path_provider.dart';

class CameraPage extends StatefulWidget {
  final List<CameraDescription> camera;
  const CameraPage({super.key, required this.camera});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController cameraController;
  late Future<void> cameraValue;
  final double overlayTakePhotoWidth = 0.9;
  final double overlayTakePhotoHeight = 0.8;
  List<XFile> capturedImage = [];
  Offset? _tapPosition; // For showing a focus indicator

  @override
  void initState() {
    startCamera(0);
    super.initState();
  }

  void startCamera(int cameraIndex) {
    print("start");
    cameraController = CameraController(
      widget.camera[cameraIndex],
      ResolutionPreset.ultraHigh,
      enableAudio: false,
    );
    cameraValue = cameraController.initialize().then((_) {
      // Make sure to check if initialized successfully
      if (cameraController.value.isInitialized) {
        if (cameraController.description.lensDirection !=
            CameraLensDirection.back) {
          cameraController.setFocusMode(FocusMode.auto).catchError((e) {
            print("Error enabling auto-focus: $e");
          });
        }
      }
    }).catchError((e) {
      print("Error initializing camera: $e");
    });
  }

  Future<void> takePhoto() async {
    print("Take photo");
    // Check if the limit of captured images is reached
    if (capturedImage.length >= 3) {
      print("Maximum number of images captured.");
      return;
    }
    try {
      await cameraValue;
      final XFile image = await cameraController.takePicture();

      // Crop the image based on the overlay
      final croppedImage = await cropImage(image.path);

      // Navigate to preview screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewScreen(
            picture: croppedImage,
            onRetake: () {
              // Remove the last captured image and pop the preview
              // setState(() {
              //   if (capturedImage.length > 0) {
              //     capturedImage.removeLast();
              //   }
              // });
              print(capturedImage.length);
              Navigator.pop(context);
            },
            onStore: () {
              setState(() {
                capturedImage.add(croppedImage);
              });
              Navigator.pop(context);
              print(capturedImage.length);
              print(capturedImage);
              print(croppedImage);
            },
          ),
        ),
      );

      print("Captured image: ${croppedImage.path}");
    } catch (e) {
      print("Error capturing photo: $e");
    }
  }

  // Function to crop the image
  Future<XFile> cropImage(String imagePath) async {
    // Load the image file
    final img.Image originalImage =
        img.decodeImage(File(imagePath).readAsBytesSync())!;

    // Define the cropping rectangle based on the overlay dimensions
    double overlayWidth = 0.9; // 70% of width
    double overlayHeight = 0.6; // 40% of height

    // Get the size of the original image
    int imageWidth = originalImage.width;
    int imageHeight = originalImage.height;

    // Calculate the cropping rectangle's position
    int cropX = (imageWidth * (1 - overlayWidth) / 2).toInt();
    int cropY = (imageHeight * (1 - overlayHeight) / 2).toInt();
    int cropWidth = (imageWidth * overlayWidth).toInt();
    int cropHeight = (imageHeight * overlayHeight).toInt();

    // Crop the image
    img.Image croppedImage = img.copyCrop(originalImage,
        x: cropX, y: cropY, width: cropWidth, height: cropHeight);

    // Save the cropped image to a temporary file
    final directory = await getTemporaryDirectory();
    final croppedImagePath =
        '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.png';
    File(croppedImagePath).writeAsBytesSync(img.encodePng(croppedImage));

    // Return the cropped image as XFile
    return XFile(croppedImagePath);
  }

  void onTapFocus(TapDownDetails details, Size size) {
    if (!cameraController.value.isInitialized) {
      return;
    }

    final tapPosition = details.localPosition;

    double focusX = tapPosition.dx / size.width;
    double focusY = tapPosition.dy / size.height;

    cameraController.setFocusPoint(Offset(focusX, focusY)).catchError((e) {
      print("Error setting focus point: $e");
    });

    setState(() {
      _tapPosition = tapPosition;
    });

    Future.delayed(Duration(milliseconds: 1500), () {
      setState(() {
        _tapPosition = null;
      });

      cameraController.setFocusMode(FocusMode.auto).catchError((e) {
        print("Error re-enabling auto focus: $e");
      });
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: CameraPreview(cameraController),
          ),
          OverlayWithRectangleClipping(onTapFocus: onTapFocus),
          if (_tapPosition != null) // Show focus indicator
            Positioned(
              left: _tapPosition!.dx - 50,
              top: _tapPosition!.dy - 50,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.yellow)),
              ),
            ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("object");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.3)),
                      padding: EdgeInsets.all(12),
                      child: Icon(
                        Icons.close,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      AlertDialog();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.3)),
                      padding: EdgeInsets.all(12),
                      child: Icon(
                        Icons.quiz,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
                padding: EdgeInsets.only(right: 20, bottom: 100),
                child: capturedImage.length > 0
                    ? Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white),
                        child: Text(
                          "ประมวลผล(${capturedImage.length})",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ))
                    : SizedBox(
                        width: 1,
                      )),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20, bottom: 90),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                width: 50,
                height: 50,
                child: capturedImage.length > 0
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.file(
                          File(capturedImage.last.path),
                          fit: BoxFit.cover,
                        ),
                      )
                    : Center(child: Text("00")),
              ),
            ),
          ),
          // Align(alignment: Alignment.bottomLeft,child: capturedImage.length > 0 ? Container(child: ,):,),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.all(70), // Adjust padding for positioning
              child: GestureDetector(
                onTap: () {
                  takePhoto();
                },
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: Container(
                    width: 70,
                    height: 70, // Ensure the button is circular
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OverlayWithRectangleClipping extends StatelessWidget {
  final Function(TapDownDetails, Size) onTapFocus;

  OverlayWithRectangleClipping({required this.onTapFocus});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => onTapFocus(details, MediaQuery.of(context).size),
      child: CustomPaint(
        size: MediaQuery.of(context).size,
        painter: RectanglePainter(),
      ),
    );
  }
}

class RectanglePainter extends CustomPainter {
  final double borderWidth;

  RectanglePainter({this.borderWidth = 2.0});

  @override
  void paint(Canvas canvas, Size size) {
    final maskPaint = Paint()..color = Colors.black.withOpacity(0.7);
    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
        Path()
          ..addRRect(RRect.fromRectAndRadius(
            Rect.fromCenter(
              center: Offset(size.width * 0.5, size.height * 0.5),
              width: size.width * 0.9,
              height: size.height * 0.6,
            ),
            Radius.circular(28),
          ))
          ..close(),
      ),
      maskPaint,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(size.width * 0.5, size.height * 0.5),
          width: size.width * 0.9,
          height: size.height * 0.6,
        ),
        Radius.circular(28),
      ),
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
