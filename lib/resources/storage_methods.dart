import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods{
  final FirebaseStorage _storage = FirebaseStorage.instance;

  //Adding image to firebase storage
  Future<String> uploadImageToStorage(String childName, Uint8List file, bool isPost){

  }
}