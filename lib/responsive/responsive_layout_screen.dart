import 'package:flutter/material.dart';
import 'package:instagram_clone/provider/user_provider.dart';
import 'package:instagram_clone/utils/global_variables.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    super.initState();
    addData();
  }

  addData() async{
    UserProvider _userProvider = Provider.of<UserProvider>(context, listen: false);
    await _userProvider.refreshUser();
  }
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