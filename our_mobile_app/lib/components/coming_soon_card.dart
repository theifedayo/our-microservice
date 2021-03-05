import 'package:flutter/material.dart';

class ComingSoonCard extends StatelessWidget {
  ComingSoonCard({ this.color, this.cardText, this.cardIcon});

  final Color color;
  final String cardText;
  final Icon cardIcon;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        //height: 140.0,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(22.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  cardText,
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "\$100,000.00",
                  style: TextStyle(
                      fontSize: 26.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                FlatButton.icon(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                  color: Color(0xFF231C4F),
                  onPressed: () {},
                  icon: cardIcon,
                  label: Text(
                    "Topup",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}