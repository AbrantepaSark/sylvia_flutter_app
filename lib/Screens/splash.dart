// ignore_for_file: file_names
import "package:flutter/material.dart";
import 'dart:async';

import './landing.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splashScreen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 4),
      () => Navigator.pushReplacementNamed(context, LandingScreen.routeName),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/girl.png", height: width * 0.3),
            Text(
              "Sylvia",
              style: TextStyle(
                fontSize: width * 0.09,
                fontFamily: "Poppins",
              ),
            )
          ],
        ),
      ),
    );
  }
}
