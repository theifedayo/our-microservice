import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;
import 'package:our_mobile_app/constants.dart';
import 'home_page.dart';
import 'network.dart';
import 'settings.dart';
import 'edit_profile.dart';
import 'search.dart';



class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ListView(
        children: [
          SizedBox(height: 20,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/ifedayo.jpg'),
                ),
              ),
              SizedBox(width: 60,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40,),
                  Text("@Ifedayo", style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 10,),
                  Text("IFEDAYO ADESIYAN",  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold
                  )),
                  SizedBox(height: 10,),
                  Container(
                    width: 220,
                    child: Text("1x Engineer 👩🏼‍🚒 🎯",style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold
                    )),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 GestureDetector(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfilePage(
                     )));
                   },
                   child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        width: 150,
                        height: 50,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("✍🏼  EDIT PROFILE", style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  decoration: TextDecoration.none
                              ))
                            ],
                          ),
                        ),
                   ),
                 ),
                SizedBox(width: 30),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage(
                    )));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    width: 150,
                    height: 50,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("⚙️ SETTINGS", style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              decoration: TextDecoration.none
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      //   child: FloatingActionButton(
      //     onPressed: _showDialog,
      //     tooltip: 'Increment',
      //     backgroundColor: Colors.deepPurpleAccent,
      //     child: Icon(FontAwesomeIcons.plus),
      //   ),
      // ),
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
                // IconButton(icon: Icon(FontAwesomeIcons.home),iconSize: 25, onPressed: (){
                //   Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(
                //   )));
                // }),
                IconButton(icon: Icon(FontAwesomeIcons.home), color: Colors.grey,iconSize: 25, onPressed: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage(),), (route) => false);
                }),
                IconButton(icon: Icon(FontAwesomeIcons.search), color: Colors.grey, iconSize: 25, onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage(
                  )));
                }),
                IconButton(icon: Icon(FontAwesomeIcons.users),color: Colors.grey, iconSize: 25, onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FriendsNetworkPage(
                  )));
                }),
                GestureDetector(
                  child: Container(
                    width: 25.0,
                    height: 25.0,
                    decoration: new BoxDecoration(
                      color: Colors.white,
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
