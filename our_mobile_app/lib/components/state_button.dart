import 'package:flutter/material.dart';


class stateButton extends StatelessWidget {
  stateButton({this.onPress, this.loading});

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