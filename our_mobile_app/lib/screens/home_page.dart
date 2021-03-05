import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:our_mobile_app/screens/network.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;
import 'package:our_mobile_app/constants.dart';
import 'package:our_mobile_app/screens/profile.dart';
import 'package:our_mobile_app/components/round_icon.dart';
import 'create_talk.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String talkValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
            Row(
              children: [Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 28),
                child: GestureDetector(
                  onTap: (){
                    //TODO: This should go to the user's profile
                  },
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: new BoxDecoration(
                      color: Colors.grey,
                      image: new DecorationImage(
                        image: new AssetImage('images/ifedayo.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                      border: new Border.all(
                        color: Colors.grey[200],
                        width: 2.0,
                      ),

                    ),
                  ),
                ),
              ), Text('Hi, Ifedayo!', style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold
              ),),
                SizedBox(width: 190,), //TODO : Get the size of the screen and minus 30 for the bell space!
                IconButton(icon: Icon(FontAwesomeIcons.bell, color: Colors.white,),iconSize: 25, onPressed: null),
            ]
            )
        ],
      )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: FloatingActionButton(
          onPressed: _showDialog,
          backgroundColor: Colors.deepPurpleAccent,
          child: Icon(FontAwesomeIcons.plus),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF151521),
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        child: Container(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(icon: Icon(FontAwesomeIcons.home, color: Colors.white,),iconSize: 25, onPressed: null),
                IconButton(icon: Icon(FontAwesomeIcons.search),color: Colors.grey, iconSize: 25, onPressed: null),
                IconButton(icon: Icon(FontAwesomeIcons.users),color: Colors.grey, iconSize: 25, onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FriendsNetworkPage(
                  )));
                }),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(
                    )));
                  },
                  child: Container(
                    width: 25.0,
                    height: 25.0,
                    decoration: new BoxDecoration(
                      color: Colors.grey,
                      image: new DecorationImage(
                        image: new AssetImage('images/ifedayo.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                      border: new Border.all(
                        color: Colors.grey[200],
                        width: 2.0,
                      ),

                    ),
                  ),
                )
                // IconButton(icon: Icon(FontAwesomeIcons.user),iconSize: 25, onPressed: null)
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _showDialog() {
    slideDialog.showSlideDialog(
      context: context,
      child: Expanded(
        child: ListView(
          children: [
            Text("Create Your Talk Group✌", textAlign: TextAlign.center,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                fontFamily: 'Akaya Kanadaka',

            ),),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0,),
              child: Column(
                children: [
                  TextFormField(
                      onChanged: (value){
                        talkValue = value;
                      },
                    // controller: usernameController,
                    style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'RocknRollOne'
                    ),
                    decoration: InputDecoration(

                        // errorText: validate ? usernameerrorText: null,
                        filled: true,
                        fillColor: kinputColor,
                        hintText: 'What\'s the talk about?',
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
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RoundIconButton(icon: FontAwesomeIcons.check, color: Colors.green[300], iconcolor: Color(0xFFCBEEEA), onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateTalkPage(talkGroupName: talkValue,
                        )));
                      },)
                    ],
                  )
                ],
              ),
            ),


          ],
        ),
      ),

    );
  }
}
