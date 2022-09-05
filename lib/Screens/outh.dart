import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

import '../Screens/welcome.dart';

import '../Widgets/button.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = "auth";
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLoading = false;
  File? _image;

  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;
      final imageTemporary = File(image.path);

      setState(() {
        this._image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var children2 = [
      if (_image == null)
        Container(
          alignment: Alignment.center,
          height: width * .7,
          width: width * .7,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: const Text("Image"),
        )
      else
        Container(
          alignment: Alignment.center,
          height: width * .7,
          width: width * .7,
          decoration: BoxDecoration(
            border: Border.all(),
            image:
                DecorationImage(image: FileImage(_image!), fit: BoxFit.cover),
          ),
        ),
      const SizedBox(height: 10),
      TextButton.icon(
        icon: const Icon(Icons.photo_camera),
        onPressed: getImage,
        label: const Text(
          "Take selfie",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      const SizedBox(height: 20),
      if (_image == null)
        CustomButton(
          child: TextButton(
            onPressed: () {},
            child: Text(
              "No image to scan",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        )
      else
        CustomButton(
          child: TextButton(
            onPressed: () {
              setState(() {
                _isLoading = true;
              });
              Timer(
                const Duration(seconds: 3),
                () {
                  _isLoading = false;
                  Navigator.pushReplacementNamed(
                      context, WelcomeScreen.routeName);
                },
              );
            },
            child: _isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Text(
                    "Scan",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
          ),
        ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Verification"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children2,
          ),
        ),
      ),
    );
  }
}
