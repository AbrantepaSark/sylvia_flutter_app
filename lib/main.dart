import 'package:flutter/material.dart';

import 'Screens/splash.dart';
import 'Screens/landing.dart';
import 'Screens/outh.dart';
import 'Screens/welcome.dart';
import 'Screens/category.dart';
import 'Screens/cat_details.dart';
import 'Screens/response.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Silvia App',
      theme: ThemeData(fontFamily: "Poppins"),
      home: const SplashScreen(),
      routes: {
        SplashScreen.routeName: (ctx) => const SplashScreen(),
        LandingScreen.routeName: (ctx) => const LandingScreen(),
        AuthScreen.routeName: (ctx) => const AuthScreen(),
        WelcomeScreen.routeName: (ctx) => const WelcomeScreen(),
        MyCat.routeName: (ctx) => const MyCat(),
        CatDetails.routeName: (ctx) => const CatDetails(),
        Response.routeName: (ctx) => const Response(),
      },
    );
  }
}
