import 'dart:developer';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  //signup user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file
  }) async {
    String res = "Some error occured";
    try {
      if(email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || bio.isNotEmpty || file != null){
        // register users
       UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
       

       //add user to our database
       _firestore.collection('users').doc(cred.user!.uid).set({
        'username': username,
        'uid': cred.user!.uid,
        'email': email,
        'bio': bio,
        'followers': [],
        'following': []
        
       });

      }
    } catch (err) {
      res = err.toString();      
    }

    return res;
  }
}