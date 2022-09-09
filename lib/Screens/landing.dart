import 'package:flutter/material.dart';

import './outh.dart';

import '../Widgets/button.dart';

class LandingScreen extends StatelessWidget {
  static const routeName = "landingPage";
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned.fill(
            child: Image(
                image: AssetImage("assets/images/bg.jpeg"), fit: BoxFit.cover),
          ),
          Container(
            height: height,
            width: width,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.green,
                  Colors.green.withOpacity(.7),
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
              ),
            ),
          ),
          Positioned(
            bottom: height * .04,
            child: Column(
              children: [
                Text(
                  "Welcome to STU",
                  style: TextStyle(
                    fontSize: width * 0.065,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Your Virtual Assistant",
                  style: TextStyle(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Bellota",
                  ),
                ),
                CustomButton(
                  color: Colors.white,
                  child: TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AuthScreen.routeName),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
