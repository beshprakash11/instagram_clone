import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/utils/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //svg images
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                 color: primaryColor,
                  height: 64,
              ),
              SizedBox(height: 64,),
              //text field input for email
              

              // text field input for password
              // button login
              // Transitioning to sigining up
            ]
          ),
        )
      ),
    );
  }
}