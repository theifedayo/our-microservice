import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:our_mobile_app/screens/home_page.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;
import 'package:our_mobile_app/constants.dart';
import 'package:our_mobile_app/screens/profile.dart';
import 'package:our_mobile_app/components/round_icon.dart';
import 'create_talk.dart';
import 'package:our_mobile_app/components/coming_soon_card.dart';

class FriendsNetworkPage extends StatefulWidget {
  @override
  _FriendsNetworkPageState createState() => _FriendsNetworkPageState();
}

class _FriendsNetworkPageState extends State<FriendsNetworkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(

            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  ),
                    Text('Network Games', textAlign: TextAlign.center, style: TextStyle(
                      fontFamily: 'Akaya Kanadaka',
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),),
                    SizedBox(width: 70,), //TODO : Get the size of the screen and minus 30 for the bell space!
                    IconButton(icon: Icon(FontAwesomeIcons.bell, color: Colors.white,),iconSize: 25, onPressed: null),
                  ]
              ),
              SizedBox(height: 150,),
              Icon(FontAwesomeIcons.users, color: Colors.white, size: 100,),
              SizedBox(height: 200,),
              ComingSoonCard(color: Color(0xFFDBD4F2), mainText: 'COMING SOON!'),
            ],
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
                IconButton(icon: Icon(FontAwesomeIcons.home, color: Colors.grey,),iconSize: 25, onPressed: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage(),), (route) => false);
                }),
                IconButton(icon: Icon(FontAwesomeIcons.search, color: Colors.grey), iconSize: 25, onPressed: null),
                IconButton(icon: Icon(FontAwesomeIcons.users, color: Colors.white), iconSize: 25, onPressed: null),
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
}


