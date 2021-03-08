import 'package:flutter/material.dart';

class AfterSplashButton extends StatelessWidget {
  AfterSplashButton({@required this.buttonText, this.onPress});

  final String buttonText;
  final Function onPress;

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
                  child: Text(buttonText,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
            ),
          )
      ),
    );
  }
}
