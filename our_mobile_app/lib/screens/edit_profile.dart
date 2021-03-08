import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:our_mobile_app/constants.dart';
import 'package:our_mobile_app/components/aftersplashbutton.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 10),
            Row(
                children: [
                  GestureDetector(onTap: (){
                    Navigator.pop(context);
                  },child: Icon(Icons.arrow_back_sharp)),
                  SizedBox(width: 20,),
                  Text('Edit Profile', textAlign: TextAlign.left, style: TextStyle(
                      fontFamily: 'Akaya Kanadaka',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.none
                  ),),
                ]
            ),
            SizedBox(height: 10,),

            SizedBox(height: 40,),
            Center(
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('images/ifedayo.jpg'),
                  ),
                  Positioned(
                    bottom: 20.0,
                    right: 20.0,
                    child: GestureDetector(
                      onTap: (){

                      },
                      child: Icon(
                        FontAwesomeIcons.camera,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: TextFormField(
                // controller: usernameController,
                style: TextStyle(
                    color: Colors.white70,
                    fontFamily: 'RocknRollOne'
                ),
                decoration: InputDecoration(
                    labelText: "Full name",
                    labelStyle: TextStyle(color: Colors.white70, fontSize: 16,fontWeight: FontWeight.bold, fontFamily: 'Montserrat', decorationColor: Colors.red,),
                    // errorText: validate ? usernameerrorText: null,
                    filled: true,
                    fillColor: kinputColor,
                    hintStyle: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Montserrat'
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.green)
                    )
                ),

              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: TextFormField(
                // controller: usernameController,
                style: TextStyle(
                    color: Colors.white70,
                    fontFamily: 'RocknRollOne'
                ),
                decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white70, fontSize: 16,fontWeight: FontWeight.bold, fontFamily: 'Montserrat', decorationColor: Colors.red,),
                    // errorText: validate ? usernameerrorText: null,
                    filled: true,
                    fillColor: kinputColor,
                    hintStyle: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Montserrat'
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.green)
                    )
                ),

              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: TextFormField(
                maxLength: 50,
                maxLines: 2,
                // controller: usernameController,
                style: TextStyle(
                    color: Colors.white70,
                    fontFamily: 'RocknRollOne'
                ),
                decoration: InputDecoration(
                    labelText: "Bio",
                    labelStyle: TextStyle(color: Colors.white70, fontSize: 16,fontWeight: FontWeight.bold, fontFamily: 'Montserrat', decorationColor: Colors.red,),
                    // errorText: validate ? usernameerrorText: null,
                    filled: true,
                    fillColor: kinputColor,
                    hintStyle: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Montserrat'
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.green)
                    )
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
