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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  
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
                textEditingController: _emailController,
              ),
              
              SizedBox(height: 24,),
              // text field input for password
              TextFieldInput(
                hintText: 'Enter your pssword',
                textInputType: TextInputType.emailAddress,
                textEditingController: _passwordController,
                isPass: true,
              ),
              SizedBox(height: 24,),
              // button login
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                width: double.infinity,
                alignment: Alignment.center,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4)
                    )
                  ),
                  color: blueColor
                ),
                child: const Text('Log in'),
              ),
              // Transitioning to sigining up
            ]
          ),
        )
      ),
    );
  }
}