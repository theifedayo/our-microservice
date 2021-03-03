import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(

          primaryColor: Color(0XFF0A0E21),
          scaffoldBackgroundColor: kBackgroundColor,
          accentColor: Colors.purple,
          textTheme: TextTheme(body1: TextStyle(color: Colors.white),),

        ),
      home: SplashScreen(),
    );
  }
}
