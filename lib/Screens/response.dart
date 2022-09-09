import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Models/question.dart';

class Response extends StatefulWidget {
  static const routeName = "response";
  const Response({Key? key}) : super(key: key);

  @override
  State<Response> createState() => _ResponseState();
}

class _ResponseState extends State<Response> {
  FlutterTts flutterTts = FlutterTts();
  String voiceText = '';

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      (() => flutterTts.speak(voiceText)),
    );
  }

  @override
  Widget build(BuildContext context) {
    var catDetail = ModalRoute.of(context)!.settings.arguments as Question;
    voiceText = catDetail.text;
    final Uri _url = Uri.parse(catDetail.link);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Sylvia"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 100,
                color: Colors.grey.shade400,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 32,
                      child: Image.asset("assets/images/girl.png"),
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      child: Text(
                        catDetail.title,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Text(
                  catDetail.text,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 16, height: 2),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  launchUrl(_url);
                },
                child: const Text("READ MORE"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
