import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/dimensions.dart';

class ResponsvieLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  const ResponsvieLayout({
    Key? key, 
    required this.webScreenLayout, 
    required this.mobileScreenLayout
  }): super(key:  key);

  @override
  State<ResponsvieLayout> createState() => _ResponsvieLayoutState();
}

class _ResponsvieLayoutState extends State<ResponsvieLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if(constraints.maxWidth > webScreenSize){
          //Webscreen
          return widget.webScreenLayout;

        }
        //Mobile screen
        return widget.mobileScreenLayout;
      },
    );
  }
}