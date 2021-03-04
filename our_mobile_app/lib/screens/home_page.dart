import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home")),
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
                IconButton(icon: Icon(FontAwesomeIcons.home),iconSize: 25, onPressed: null),
                IconButton(icon: Icon(FontAwesomeIcons.search),iconSize: 25, onPressed: null),
                IconButton(icon: Icon(FontAwesomeIcons.users),iconSize: 25, onPressed: null),
                IconButton(icon: Icon(FontAwesomeIcons.user),iconSize: 25, onPressed: null)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
