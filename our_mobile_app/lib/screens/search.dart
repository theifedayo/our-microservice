import 'package:flutter/material.dart';
import 'profile.dart';
import 'home_page.dart';
import 'network.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [Text("hello")],
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
                // IconButton(icon: Icon(FontAwesomeIcons.home),iconSize: 25, onPressed: (){
                //   Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(
                //   )));
                // }),
                IconButton(icon: Icon(FontAwesomeIcons.home), color: Colors.grey,iconSize: 25, onPressed: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage(),), (route) => false);
                }),
                IconButton(icon: Icon(FontAwesomeIcons.search), color: Colors.grey, iconSize: 25, onPressed: null),
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
