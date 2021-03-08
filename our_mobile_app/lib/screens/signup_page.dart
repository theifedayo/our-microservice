import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:our_mobile_app/constants.dart';
import 'login_page.dart';
import 'after_splash_screen.dart';
import 'package:our_mobile_app/services/networking.dart';
import 'package:our_mobile_app/components/state_button.dart';
import 'home_page.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:our_mobile_app/components/aftersplashbutton.dart';




class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool vis = true;
  final globalKey = GlobalKey<FormState>();
  NetworkHelper networkHelper = NetworkHelper();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String errorText;
  String usernameerrorText;
  String passworderrorText;
  bool validate = false;
  bool circular = false;
  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: globalKey,
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
                    child: TextFormField(
                      controller: usernameController,

                      style: TextStyle(
                          color: Colors.white70,
                          fontFamily: 'RocknRollOne'
                      ),
                      decoration: InputDecoration(
                          errorText: validate ? null : errorText,
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
                    padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                    child: TextFormField(
                      controller: emailController,
                        validator: (value){
                          if(value.isEmpty){
                            return 'email cannot be empty';
                            return null;
                          }else if(!value.contains('@')){
                            return 'invalid email';
                          }
                        },
                      style: TextStyle(
                          color: Colors.white70,
                          fontFamily: 'RocknRollOne'
                      ),
                      decoration: kEmailFieldInputDecoration,

                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: passwordController,
                      validator: (value){
                        if(value.isEmpty) {
                          return 'password cannot be empty';
                        }else if(value.length <= 7){
                          return 'password should be more than 7 characters';
                          return null;
                        }
                      },
                      obscureText: vis,
                      style: TextStyle(
                          color: Colors.white70,
                          fontFamily: 'RocknRollOne'
                      ),
                      decoration: InputDecoration(
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
                    height: 40,
                  ),
                  circular ? stateButton(loading: CircularProgressIndicator()): AfterSplashButton(buttonText: 'SIGN UP', onPress: () async {
                    print("hello");
                    setState(() {
                      circular = true;
                    });
                    await checkusername();

                    setState(() {
                      circular = false ;
                    });
                    if(globalKey.currentState.validate() && validate){
                        Map<String, String> data = {
                          "username": usernameController.text,
                          "email": emailController.text,
                          "password": passwordController.text
                        };

                        print(data);
                        await networkHelper.post("/api/v1/register", data);
                        Map<String, String> logindata = {
                          "username": usernameController.text,
                          "password": passwordController.text
                        };

                        var response = await networkHelper.post("/api/v1/login", logindata);
                        if(response.statusCode == 200 || response.statusCode == 201){
                          Map output = json.decode(response.body);
                          print(output);

                          setState(() {
                            validate = true;
                            circular = false;
                            usernameerrorText = output["usernamemessage"];
                            passworderrorText = output["passwordmessage"];
                          });
                          if(output["token"] != null){
                            await storage.write(key: "token", value: output["token"]);
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage(),), (route) => false);
                          };

                        }else{
                          String output = json.decode(response.body);
                          setState(() {
                            validate = false;
                            circular = false;
                          });
                        }


                    }
                    },
                  ),

                ],
              ),
            ),
          ),
        )
    );
  }
  checkusername() async {
    if(usernameController.text.length==0){
      setState(() {
        circular=false;
        validate = false;
        errorText = 'username cannot be empty';
      });
    }else{

      var response = await networkHelper.get('/api/v1/${usernameController.text}');
      print(response);
      if(response['status']==true){
        setState(() {
          circular=false;
          validate = false;
          errorText = 'username already taken';
        });

      }else{
        setState(() {
          validate = true;
        });

      }
    }
  }

}




final signuppasswordFieldInputDecoration = InputDecoration(
    suffixIcon: IconButton(icon: Icon(Icons.visibility_off), onPressed: (){

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
);


