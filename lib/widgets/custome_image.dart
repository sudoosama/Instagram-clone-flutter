import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget cachedNetworkImage(mediaUrl){
  return CachedNetworkImage(imageUrl: mediaUrl,
    fit: BoxFit.cover,
    placeholder: (context,url)=>Padding(
        child: CircularProgressIndicator(),
        padding: EdgeInsets.all(20.0)
    ),
    errorWidget: (context,url,error)=>
        Icon(Icons.error),
  );
}