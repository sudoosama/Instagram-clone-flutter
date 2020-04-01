import 'package:flutter/material.dart';
import 'package:socialmedia/widgets/header.dart';
import 'package:socialmedia/widgets/progress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final usersRef = Firestore.instance.collection('users');

class TimeLine extends StatefulWidget {
  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  List<dynamic> users = [];

  @override
  void initState() {
    getUsers();
    //getUserById();
    super.initState();
  }

// getUserById()async {
//   final QuerySnapshot snapshot= await usersRef.getDocuments();
//   snapshot.documents.forEach((DocumentSnapshot doc){
//     print(doc.data);
//   });
// }

  getUsers() async {
    final QuerySnapshot snapshot = await usersRef.getDocuments();
    setState(() {
      users = snapshot.documents;
    });
  }
  //usersRef.getDocuments().then((QuerySnapshot snapshot){
  // snapshot.documents.forEach((DocumentSnapshot doc){
  // print(doc.data);
  // print(doc.documentID);
  // print(doc.exists);
  //    });
  //});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(isAppTitle: true),
      body: FutureBuilder<QuerySnapshot>(
          future: usersRef.getDocuments(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return circularProgress();
            }
            final List<Text> children = snapshot.data.documents
                .map((doc) => Text(doc['username']))
                .toList();
            return Container(
              child: ListView(
                children: children,
              ),
            );
          }),
    );
    //Text("Timeline"),
  }
}
