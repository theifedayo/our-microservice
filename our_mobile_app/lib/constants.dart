import 'package:flutter/material.dart';


const kBackgroundColor = Color(0XFF0B0D16);
const kButtonColor = Color(0XFF181A23);
const kinputColor = Color(0XFF64697f);


const kTextFieldInputDecoration = InputDecoration(
    filled: true,
    fillColor: kinputColor,
    hintText: 'Enter username',
    hintStyle: TextStyle(
        color: Colors.white70,
        fontFamily: 'RocknRollOne'
    ),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide.none
    )
);

const kpasswprdFieldInputDecoration = InputDecoration(
    filled: true,
    fillColor: kinputColor,
    hintText: 'Enter password',
    hintStyle: TextStyle(
        color: Colors.white70,
        fontFamily: 'RocknRollOne'
    ),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide.none
    )
);