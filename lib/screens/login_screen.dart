import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/screens/siginup_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/global_variables.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

import '../responsive/mobile_screen_loyout.dart';
import '../responsive/responsive_layout_screen.dart';
import '../responsive/web_screen_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUsers(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const ResponsvieLayout(
                mobileScreenLayout: MobileScreenLayout(),
                webScreenLayout: WebScreenLayout(),
              )));
    } else {
      showSnackBar(context, res);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void navigateToSignUp() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SignupScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: MediaQuery.of(context).size.width > webScreenSize
            ? EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 3)
            : const EdgeInsets.symmetric(horizontal: 32),
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
          child: const Text('Don\'t have an account'),
        ),
        GestureDetector(
          onTap: navigateToSignUp,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: const Text(
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
      onTap: loginUser,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        alignment: Alignment.center,
        decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4))),
            color: blueColor),
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              )
            : const Text('Log in'),
      ),
    );
  }
}
