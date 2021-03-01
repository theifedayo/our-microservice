import 'package:flutter/material.dart';
import 'package:our_mobile_app/constants.dart';
import 'after_splash_screen.dart';

class LoginPage extends StatefulWidget {
  LoginPage({ this.message });
  final String message;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                child: Text('Login️',
                  style: TextStyle(
                      fontFamily: 'Akaya Kanadaka',
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  )
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                child: TextField(
                  style: TextStyle(
                      color: Colors.white70,
                      fontFamily: 'RocknRollOne'
                  ),
                  decoration: kTextFieldInputDecoration,

                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  style: TextStyle(
                      color: Colors.white70,
                      fontFamily: 'RocknRollOne'
                  ),
                  decoration: kpasswordFieldInputDecoration,

                ),
              ),
              SizedBox(
                height: 100,
              ),
              AfterSplashButton(buttonText: 'LOGIN', onPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage(
                )));
              },)
            ],
          ),
        ),
      )
    );
  }
}
