import 'package:flutter/material.dart';
import 'package:instagram_clone/models/users.dart';
import 'package:instagram_clone/resources/auth_methods.dart';

class UserProvider with ChangeNotifier{
  User? _user;
  final AuthMethods _authMethods = AuthMethods();
  User get getIser => _user!;

  Future<void> refreshUser() async{
    User user = await _authMethods.getUsersDetails();
    _user = user;
    notifyListeners();
  }
}