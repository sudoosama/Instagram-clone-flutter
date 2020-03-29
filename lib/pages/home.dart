import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn= GoogleSignIn();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool isAuth=false;


  login(){
    googleSignIn.signIn();
  }
  @override
  void initState() {
    super.initState();
    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account){
      if(account !=null){
        print('User Signed In: $account');
        setState(() {
          isAuth=true;
        });
      }
      else{
        setState(() {
          isAuth=false;
        });
      }
    });
    //Navigator.pushReplacementNamed(context, '/home');  // This is the culprit
  }
  buildAuthScreen(){
    return Text('Authticated');
  }
  buildUnAuthScreen(){
    return Scaffold(
      body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors:[
            Colors.teal,
            Colors.purple
          ]
        )
      ),
      alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("FlutterShare",
            style: TextStyle(
             // fontFamily: "Signatra",
              fontSize: 60.0,
              color: Colors.black
            ),),
            GestureDetector(
            onTap: login,
              child: Container(margin: EdgeInsets.only(left:60.0,right: 60.0),width: MediaQuery.of(context).size.width,height: 50.0,decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage('assets/images/google_signin_button.png'),
                fit: BoxFit.cover)
              ),)
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth?buildAuthScreen():buildUnAuthScreen();
  }
}