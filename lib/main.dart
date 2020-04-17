//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialmedia/pages/home.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
//  Firestore.instance.settings(timestampsInSnapshotsEnabled: true).then((_) {
//    print("Timestamp enabled in snapshots\n");
//  }, onError: (_) {
//    print("Error enabling timestamp in snapshot\n");
//  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Media App',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
