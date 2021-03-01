import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:our_mobile_app/constants.dart';
import 'login_page.dart';
import 'after_splash_screen.dart';
import 'package:our_mobile_app/services/networking.dart';


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
  bool validate = false;
  bool circular = false;

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
                  circular ? SignUpButton(loading: CircularProgressIndicator()): AfterSplashButton(buttonText: 'SIGN UP', onPress: () async {
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
                        setState(() {
                          circular = false ;
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage(message: 'Your account was successfully created!',
                        )));
                      }else{
                        setState(() {
                          circular = false ;
                        });
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



class SignUpButton extends StatelessWidget {
  SignUpButton({this.onPress, this.loading});

  final Function onPress;
  final Widget loading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.deepPurpleAccent,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: Padding(
            padding: EdgeInsets.all(1.0),
            child: ListTile(
                title: Center(
                  child: loading,
                )
            ),
          )
      ),
    );
  }
}