import 'dart:async';
import 'package:flutter/material.dart';
import 'after_splash_screen.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final splashDelay = 5;

  @override
  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => AfterSplash()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Text('our 😷✌️', style: TextStyle(
              fontFamily: 'Akaya Kanadaka',
              fontSize: 60.0,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),))
        ],
      ),
    );
  }
}