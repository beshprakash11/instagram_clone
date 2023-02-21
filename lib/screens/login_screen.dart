import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              Flexible(child: Container(), flex: 1,),
              //svg images
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                 color: primaryColor,
                  height: 64,
              ),
              SizedBox(height: 64,),
              //text field input for email
              TextFieldInput(
                hintText: 'Enter your name',
                textInputType: TextInputType.emailAddress,
              ),
              

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