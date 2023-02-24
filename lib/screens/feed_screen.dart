import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title: Text('Feed screen'),
      ),
      body: Center(child: Text('Feed screen'),),
    );
  }
}