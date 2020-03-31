import 'package:flutter/material.dart';

AppBar header({bool isAppTitle=false, String titleText}){
  return AppBar(
    title: Text(
      isAppTitle? "Social Media":titleText,
    style: TextStyle(
      color: Colors.white,
      fontSize:
      isAppTitle?50.0:22.0
    ),),
    centerTitle: true,
    backgroundColor: Colors.teal,
  );
}