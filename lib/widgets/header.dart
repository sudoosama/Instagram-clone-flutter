import 'package:flutter/material.dart';

AppBar header({bool isAppTitle=false, String titleText,removeBackButton=false}){
  return AppBar(
    automaticallyImplyLeading: removeBackButton ? false:true,
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