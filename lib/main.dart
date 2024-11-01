import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:frontend/pages/camera_page.dart';
import 'package:frontend/pages/form_page.dart';
import 'package:frontend/pages/home_page.dart';
import 'package:frontend/pages/product_page.dart';
import 'package:frontend/pages/splash_loading_page.dart';
import 'package:google_fonts/google_fonts.dart';

List<CameraDescription>? _cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _cameras = await availableCameras();
  runApp(MyApp(
    cameras: _cameras,
  ));
}

class CustomTextTheme {
  static TextTheme getTextTheme() {
    return TextTheme(
      displayLarge: GoogleFonts.anuphan(
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: GoogleFonts.anuphan(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      headlineLarge: GoogleFonts.anuphan(
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: GoogleFonts.anuphan(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      bodyLarge: GoogleFonts.anuphan(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: GoogleFonts.anuphan(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      // Add more styles as needed
    );
  }
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MyApp({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: CustomTextTheme.getTextTheme(),
      ),
      home: ProductPage(),
    );

    // home: CameraPage(
    //   camera: cameras,
    // ));
  }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       textTheme: CustomTextTheme.getTextTheme(),
  //     ),
  //     home: CameraPage(
  //     camera: cameras,
  //   ));

  //   // home: CameraPage(
  //   //   camera: cameras,
  //   // ));
  // }
}
