import 'package:flutter/material.dart';
import 'package:our_mobile_app/constants.dart';
import 'after_splash_screen.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [

                Row(
                    children: [
                      GestureDetector(onTap: (){
                        Navigator.pop(context);
                      },child: Icon(Icons.arrow_back_sharp))
                    ]
                ),
                SizedBox(height: 200,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('our 😷✌️',
                    style: TextStyle(
                        fontFamily: 'Akaya Kanadaka',
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('Sign up️',
                      style: TextStyle(
                          fontFamily: 'Akaya Kanadaka',
                          fontSize: 40.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'RocknRollOne'
                    ),
                    decoration: kTextFieldInputDecoration,

                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                  child: TextField(
                    style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'RocknRollOne'
                    ),
                    decoration: kEmailFieldInputDecoration,

                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'RocknRollOne'
                    ),
                    decoration: kpasswprdFieldInputDecoration,

                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: AfterSplashButton(buttonText: 'SIGN UP', onPress: (){

                  },),
                )
              ],
            ),
          ),
        )
    );
  }
}
