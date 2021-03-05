import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ComingSoonCard extends StatelessWidget {
  ComingSoonCard({ this.color, this.cardText, this.cardIcon, this.mainText});

  final Color color;
  final String cardText;
  final String mainText;
  final Icon cardIcon;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Container(
        //height: 140.0,
        padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(22.0),
          ),
        ),
        child: Column(

          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  mainText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 19.0,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Icon(FontAwesomeIcons.bell, color: Colors.black,)
              ],
            )
          ],
        ),
      ),
    );
  }
}