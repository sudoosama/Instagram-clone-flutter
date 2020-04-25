import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar header(
    {bool isAppTitle = false,
    bool leadIcon = false,
    bool actIcon: false,
      String titleText,
    removeBackButton = false
    }) {
  return AppBar(
    leading: leadIcon
        ? IconButton(
            icon: Icon(
              Icons.camera_alt,
              size: 32.0,
              color: Colors.black,
            ),
            onPressed: () => Text(""),
          )
        : Text(""),
    automaticallyImplyLeading: removeBackButton ? false : true,
    title: Text(
      isAppTitle ? "Instagram" : titleText,
      style: GoogleFonts.grandHotel(
          color: Colors.black, fontSize: isAppTitle ? 30.0 : 22.0),
      overflow: TextOverflow.ellipsis,
    ),
    actions: <Widget>[
      Transform.rotate(
        angle: 5.5,
        child: actIcon?IconButton(
            icon: Icon(
              Icons.send,
              color: Colors.black,
              size: 25.0,
            ),
            onPressed: null):Text(""),
      )
    ],
    centerTitle: true,
    backgroundColor: Colors.white,
  );
}
