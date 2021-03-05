import 'package:flutter/material.dart';



class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon, this.onPressed, @required this.color, @required this.iconcolor});

  final IconData icon;
  final Function onPressed;
  final Color color;
  final Color iconcolor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, color: iconcolor ,),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0
      ),
      shape: CircleBorder(),
      fillColor: color,
    );
  }
}