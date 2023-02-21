import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _userController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _userController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Flexible(
            child: Container(),
            flex: 1,
          ),
          //svg images
          SvgPicture.asset(
            'assets/ic_instagram.svg',
            color: primaryColor,
            height: 64,
          ),
          const SizedBox(
            height: 64,
          ),
          // Circular widget to accept and show our selected file
          Stack(
            children: [
              CircleAvatar(
                radius: 64,
                backgroundImage: NetworkImage('https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50'),
              )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          //text field input for username
          TextFieldInput(
            hintText: 'Enter your username',
            textInputType: TextInputType.emailAddress,
            textEditingController: _userController,
          ),
          const SizedBox(
            height: 24,
          ),
          //text field input for email
          TextFieldInput(
            hintText: 'Enter your email',
            textInputType: TextInputType.emailAddress,
            textEditingController: _emailController,
          ),

          const SizedBox(
            height: 24,
          ),
          // text field input for password
          TextFieldInput(
            hintText: 'Enter your pssword',
            textInputType: TextInputType.emailAddress,
            textEditingController: _passwordController,
            isPass: true,
          ),
          const SizedBox(
            height: 12,
          ),
          //text field input for bio
          TextFieldInput(
            hintText: 'Enter your bio',
            textInputType: TextInputType.emailAddress,
            textEditingController: _bioController,
          ),
          const SizedBox(
            height: 24,
          ),
          // button login
          _buildLoginBtn(),
          Flexible(
            child: Container(),
            flex: 1,
          ),
          // Transitioning to sigining up
          _buildDontHaveAccount()
        ]),
      )),
    );
  }

  Widget _buildDontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text('Don\'t have an account'),
        ),
        GestureDetector(
          onTap: (){
            
          },
          child: Container(
            padding: EdgeInsets.all(8),
            child: Text(
              'Sign up.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildLoginBtn() {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        alignment: Alignment.center,
        decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4))),
            color: blueColor),
        child: const Text('Sign up'),
      ),
    );
  }
}
