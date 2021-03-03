import 'dart:async';
import 'package:flutter/material.dart';
import 'after_splash_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final splashDelay = 30;
  Widget page = AfterSplash();
  final storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();

    _loadWidget();
    checkLogin();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => page));
  }

  void checkLogin() async {
    String token = await  storage.read(key: "token");
    if(token != null){
      setState(() {
        page = HomePage();
      });
    }else{
      setState(() {
        page = AfterSplash();
      });
    }
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