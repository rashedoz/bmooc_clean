import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:bmooc_clean/widgets/onboarding_page.dart';
import 'package:bmooc_clean/pages/splash_screen.dart';


void main() {
  //Debugging UI widgets
   //debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(new OnBoardingApp());
}

class OnBoardingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      
      //Hide Debug banner
      debugShowCheckedModeBanner: false,

      title: 'BMOOC Onboarding App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blue[50],
      ),
      home: new SplashScreen(), //Splash screen on start then route to onboarding page
    );
  }
}

