import 'package:flutter/material.dart';


const kBackgroundColor = Color(0XFF0B0D16);
const kButtonColor = Color(0XFF181A23);
const kinputColor = Color(0XFF64697f);


const kTextFieldInputDecoration = InputDecoration(
    filled: true,
    fillColor: kinputColor,
    hintText: 'Enter your username',
    hintStyle: TextStyle(
        color: Colors.white70,
        fontFamily: 'Montserrat'
    ),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide.none
    )
);

const kEmailFieldInputDecoration = InputDecoration(
    filled: true,
    fillColor: kinputColor,
    hintText: 'Enter your email',
    hintStyle: TextStyle(
        color: Colors.white70,
        fontFamily: 'Montserrat'
    ),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide.none
    )
);

const kpasswordFieldInputDecoration = InputDecoration(
    suffixIcon: IconButton(icon: Icon(Icons.visibility_off), onPressed: null),
    filled: true,
    fillColor: kinputColor,
    hintText: 'Enter your password',
    hintStyle: TextStyle(
        color: Colors.white70,
        fontFamily: 'Montserrat'
    ),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide.none
    )
);

