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
  PageController pageController;
  int pageIndex=0;

  @override
  void initState() {

    pageController=PageController();
    pageController=PageController(
   //   initialPage: 2
    );
    super.initState();
    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account){
      handleSignIn(account);
    },onError: (err){
      print('Error Signing in: $err');
    });
    //Navigator.pushReplacementNamed(context, '/home');  // This is the culprit


    //Reauthenticate when user is sign in
    googleSignIn.signInSilently(suppressErrors: false).then((account){
      handleSignIn(account);
    }).catchError((err){
      print('Error Signing in: $err');
    });
  }
  handleSignIn(GoogleSignInAccount account){
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
  }

  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }

  login(){
    googleSignIn.signIn();
  }
  logout(){
    googleSignIn.signOut();
  }
  onPageChanged(int pageIndex){
    setState(() {
      this.pageIndex=pageIndex;
    });
  }
  onTap(int pageIndex){
    pageController.jumpToPage(pageIndex );
  }
  Scaffold buildAuthScreen(){
    return Scaffold(
      body: PageView(
        children: <Widget>[
         // Timeline(),
         // ActivityFeed(),
          //Upload(),
          //Search(),
          //Profile(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged ,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: pageIndex,
        onTap: onTap,
        activeColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.whatshot),),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_active),),
          BottomNavigationBarItem(icon: Icon(Icons.photo_camera,size: 35.0,),),
          BottomNavigationBarItem(icon: Icon(Icons.search),),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle),),


        ],
      ),
    );
    //return RaisedButton(
   //   child: Text('Logout'),
    //  onPressed: logout,
  //  );
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
