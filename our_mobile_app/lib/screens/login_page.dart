import 'package:flutter/material.dart';
import 'package:our_mobile_app/constants.dart';
import 'package:our_mobile_app/screens/home_page.dart';
import 'after_splash_screen.dart';
import 'package:our_mobile_app/services/networking.dart';
import 'dart:convert';
import 'package:our_mobile_app/components/state_button.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:our_mobile_app/components/aftersplashbutton.dart';



class LoginPage extends StatefulWidget {
  LoginPage({ this.message, this.show });
  final String message;
  bool show;


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String signupMessage;
  bool vis = true;
  final globalKey = GlobalKey<FormState>();
  NetworkHelper networkHelper = NetworkHelper();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String usernameerrorText;
  String passworderrorText;
  bool validate = false;
  bool circular = false;
  final storage = new FlutterSecureStorage();




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
                child: TextFormField(
                  controller: usernameController,
                  style: TextStyle(
                      color: Colors.white70,
                      fontFamily: 'RocknRollOne'
                  ),
                  decoration: InputDecoration(
                      errorText: validate ? usernameerrorText: null,
                      filled: true,
                      fillColor: kinputColor,
                      hintText: 'Enter your username',
                      hintStyle: TextStyle(
                          color: Colors.white70,
                          fontFamily: 'Montserrat'
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide.none
                      )
                  ),

                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: vis,
                  style: TextStyle(
                      color: Colors.white70,
                      fontFamily: 'RocknRollOne'
                  ),
                  decoration: InputDecoration(
                      errorText: validate ? passworderrorText : null,
                      suffixIcon: IconButton(icon: Icon(vis?Icons.visibility_off: Icons.visibility), onPressed: (){
                        setState(() {
                          vis = !vis;
                        });
                      },),
                      filled: true,
                      fillColor: kinputColor,
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(
                          color: Colors.white70,
                          fontFamily: 'Montserrat'
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide.none
                      )
                  ),

                ),
              ),
              SizedBox(
                height: 100,
              ),
              circular ? stateButton(loading: CircularProgressIndicator()): AfterSplashButton(buttonText: 'LOGIN', onPress: () async {
                setState(() {
                  circular = true;
                });
                Map<String, String> data = {
                  "username": usernameController.text,
                  "password": passwordController.text
                };


                var response = await networkHelper.post("/api/v1/login", data);
                print(data);

                if(response.statusCode == 200 || response.statusCode == 201){
                  Map output = json.decode(response.body);
                  print(output);

                  setState(() {
                    validate = true;
                    circular = false;
                    usernameerrorText = output["usernamemessage"];
                    passworderrorText = output["passwordmessage"];
                  });
                  print(output["token"]);

                  if(output["token"] != null){

                    await storage.write(key: "token", value: output["token"]);
                    print('COMPLETED----------------------');
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage(),), (route) => false);
                  };

                }else{
                  String output = json.decode(response.body);
                  setState(() {
                    validate = false;
                    circular = false;
                  });
                }
              },)
            ],
          ),
        ),
      )
    );
  }
}
