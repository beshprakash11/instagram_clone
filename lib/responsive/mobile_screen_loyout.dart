import 'package:flutter/material.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  String username = "";

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  void getUsername() async{
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("This is mobile"),
      ),
    );
  }
}