import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialmedia/pages/home.dart';
import 'package:socialmedia/pages/profile.dart';
import 'package:socialmedia/widgets/header.dart';
import 'package:socialmedia/widgets/post.dart';
import 'package:socialmedia/widgets/progress.dart';

class Timeline extends StatefulWidget {
  final User currentUser;
  Timeline({this.currentUser});
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  List<Post> posts;
  List<String> followingList=[];

  @override
  void initState() {
    super.initState();
    getTimeline();
    getFollowing();
  }
  getTimeline()async{
    QuerySnapshot snapshot = await timelineRef
        .document(widget.currentUser.id)
        .collection('timelinePosts')
        .orderBy('timestamp',descending: true)
        .getDocuments();
    List<Post> posts = snapshot.documents.map((doc)=>Post.fromDocument(doc)).toList();
    setState(() {
      this.posts=posts;
    });
  }

  getFollowing()async{
   QuerySnapshot snapshot= await followingRef
        .document(currentUser.id)
        .collection('userFollowing')
        .getDocuments();
   setState(() {
     followingList=snapshot.documents.map((doc)=>doc.documentID).toList();
   });
  }

  buildTimeline(){
    if(posts==null){
      return circularProgress();
    }
    else{
      return ListView(children: posts);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(isAppTitle: true),
      body: RefreshIndicator(
        onRefresh: ()=> getTimeline(),
        child: buildTimeline(),
      ),
    );
  }
}
