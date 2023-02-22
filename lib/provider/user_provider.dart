import 'package:flutter/material.dart';
import 'package:instagram_clone/models/users.dart';

class UserProvider with ChangeNotifier{
  User? _user;
  User get getIser => _user!;

  Future<void> refreshUser() async{
    
  }
}