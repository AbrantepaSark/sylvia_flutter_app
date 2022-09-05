import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import './category.dart';

import '../Widgets/button.dart';
import '../Widgets/contact.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = "Welcome";
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(milliseconds: 700),
        (() => flutterTts.speak(
            "Hello,I'm Sylvia, your virtual assistant for Sunyani Technical University. How can i help you today?")));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("I'm Sylvia"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/beauty.png", height: width * 0.6),
                  const SizedBox(height: 20),
                  const Text(
                    "Hello",
                    style: TextStyle(fontSize: 22),
                  ),
                  const Text(
                    "How can I help you today?",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    child: TextButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed(MyCat.routeName),
                      child: const Text(
                        "Let's Chat",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Contact(
                          icon: Icons.mail,
                          title: "EMAIL US",
                          text: "samuel.6190624@stu.edu.gh"),
                    ),
                  ),
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Contact(
                          icon: Icons.phone,
                          title: "CALL US",
                          text: "+233501600055"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
