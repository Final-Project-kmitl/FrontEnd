import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/pages/form_page.dart';
import 'package:frontend/pages/home_page.dart';
import 'package:frontend/pages/test_page.dart';
import "package:http/http.dart" as http;

class SplashLoadingPage extends StatefulWidget {
  const SplashLoadingPage({super.key});

  @override
  State<SplashLoadingPage> createState() => _SplashLoadingPageState();
}

class _SplashLoadingPageState extends State<SplashLoadingPage> {
  String res = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _testAPI();
  }

  Future<void> _testAPI() async {
    await dotenv.load(fileName: ".env");
    Future.delayed(Duration(seconds: 2), () async {
      final apiResponse =
          await http.get(Uri.parse('${dotenv.env["API_KEY"]}/api/test'));
      if (apiResponse.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FormPage()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FormPage()));
      }
      print(apiResponse.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F1EE),
      body: Center(
        child: Image.asset("assets/Logo.png"),
      ),
    );
  }
}
