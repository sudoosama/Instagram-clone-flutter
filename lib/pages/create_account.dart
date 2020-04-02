import 'package:flutter/material.dart';
import 'package:socialmedia/widgets/header.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey=GlobalKey<FormState>();
  String username;

  submit(){
    _formKey.currentState.save();
    Navigator.pop(context,username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(titleText: "Set up your Profile"),
      body: ListView(children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 25.0),
              child: Center(
                child: Text("Create a Username",style: TextStyle(
                  fontSize: 25.0
                ),),
              ),),
              Padding(padding: EdgeInsets.all(16.0),
              child: Container(
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                  onSaved: (val)=>username=val,
                   decoration: InputDecoration(
                     border: OutlineInputBorder(),
                     labelText: "Username",
                     labelStyle: TextStyle(fontSize: 15.0),
                     hintText: "Must be at least 3 characters",
                   ),
                )),
              ),),
              GestureDetector(
                onTap: submit,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(7.0) 
                  ),
                  child: Text("Submit",style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold
                ,  ),),
                )),
              
            ],
          ),
        )
      ],),
    );
  }
}