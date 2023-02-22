import 'dart:developer';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/resources/storage_methods.dart';

import 'package:instagram_clone/models/users.dart' as model;

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
       model.User user = model.User(
          email: email,
          uid: cred.user!.uid,
          photoUrl: photoURL, 
          username: username, 
          bio: bio, 
          followers: [], 
          following: []
        );

       _firestore.collection('users').doc(cred.user!.uid).set({
              
       });
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
  }) async{
    String res = "Some of error occures.";
    try {
      if(email.isNotEmpty || password.isNotEmpty){
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res ="success";
      }else{
        res = "Please enter all the fields";
      }
    } on FirebaseAuthException catch(err){
       if(err.code == 'user-not-found'){
        res = 'The given user email is not found.';
      }else if(err.code == 'wrong-password'){
        res = 'Password you entered is wrong.';
      }
    }
    catch (err) {
      res = err.toString();
      
    }

    return res;
  }
}