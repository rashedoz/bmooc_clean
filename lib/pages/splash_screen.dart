import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bmooc_clean/widgets/onboarding_page.dart';


class SplashScreen extends StatefulWidget{
  
  @override 
  State<StatefulWidget> createState(){
    return SplashScreenState();
  }
}


class SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();

    loadData();
  }

  //Async wait for 3(changable) seconds and show splash screen
  Future<Timer> loadData() async{
    return Timer(Duration(seconds: 3), onDoneLoading);
  }

  /* Route to onboarding page from splash screen 
    *Add route to dashboard/login logic for the 2nd time app  launch*/
  onDoneLoading() async{
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OnBoardingPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/splash_screen_bmooc.png'),
            fit: BoxFit.cover
        ) ,
      ),
    );
  }

}

