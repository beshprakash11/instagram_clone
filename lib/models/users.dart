import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User{
  final String username;
  final String uid;
  final String email;
  final String photoUrl;  
  final String bio;
  final List followers;
  final List following;

  const User({
    required this.username,
    required this.uid,
    required this.email,    
    required this.photoUrl,    
    required this.bio,
    required this.followers,
    required this.following
  });

  Map<String, dynamic> toJson() => {
    "username": username,
    "uid": uid,
    "email": email,
    "photoUrl": photoUrl,
    "bio": bio,
    "followers": followers,
    "following": following
  };

  //convert docmentsnap to data
  static User fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      username: snapshot["username"],
      uid: snapshot["uid"], 
      email: snapshot["email"], 
      photoUrl:snapshot["photoUrl"],        
      bio: snapshot["bio"], 
      followers: snapshot["followers"], 
      following: snapshot["following"]
    );
  }
}