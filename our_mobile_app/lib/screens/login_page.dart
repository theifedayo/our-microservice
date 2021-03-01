import 'package:flutter/material.dart';
import 'package:our_mobile_app/constants.dart';
import 'after_splash_screen.dart';


class LoginPage extends StatefulWidget {
  LoginPage({ this.message, this.show });
  final String message;
  bool show;


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String signupMessage;


  @override
  void initState(){
    super.initState();
    updateUI(widget.message);
  }

  void updateUI(dynamic message){
    setState(() {
      signupMessage = message;
    });

  }

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
              signupMessage != null ? Container(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('$signupMessage', textAlign: TextAlign.center ,style: TextStyle(
                        fontFamily: 'Montserrat'
                    ),),
                  ),
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.green[300],
                  )
              ): Text(''),
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
