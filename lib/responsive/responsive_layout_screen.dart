import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/dimensions.dart';

class ResponsvieLayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  const ResponsvieLayout({Key? key, required this.webScreenLayout, required this.mobileScreenLayout}): super(key:  key)

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if(constraints.maxWidth > webScreenSize){
          //Webscreen
          return webScreenLayout;

        }
        //Mobile screen
        return mobileScreenLayout;
      },
    );
  }
}