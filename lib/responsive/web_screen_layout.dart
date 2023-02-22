import 'package:flutter/material.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({super.key});

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
 String username = "";

  @override
  void initState() {
    super.initState();
    getUsername();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}