import 'dart:developer';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/resources/storage_methods.dart';

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
      if(email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || bio.isNotEmpty  || file != null){
        // register users
       UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
       
       // upload images
       String photoURL = await StorageMethods().uploadImageToStorage('profilePics', file, false);

       //add user to our database
       _firestore.collection('users').doc(cred.user!.uid).set({
        'username': username,
        'uid': cred.user!.uid,
        'email': email,
        'bio': bio,
        'followers': [],
        'following': [],
        'photoUrl': photoURL,       
       });
       //
       /*await _firestore.collection('users').add({
        'username': username,
        'uid': cred.user!.uid,
        'email': email,
        'bio': bio,
        'followers': [],
        'following': []  
       });*/
       res = "success";
      }
    } on FirebaseAuthException catch(err){
      if(err.code == 'invalid-email'){
        res = 'The email is badly formatted';
      }else if(err.code == 'weak-password'){
        res = 'Password should be at least 6 caracterss';
      }
    }
    catch (err) {
      res = err.toString();      
    }

    return res;
  }

  //login users
  Future<String> loginUsers({
    required String email,
    required String password
  }){

  }
}