import 'package:flutter/material.dart';

class User{
  final String username;
  final String uid;
  final String photoUrl;
  final String email;
  final String bio;
  final String followers;
  final String following;

  const User({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.username,
    required this.bio,
    required this.followers,
    required this.following
  });
}