import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

import '../responsive/mobile_screen_loyout.dart';
import '../responsive/responsive_layout_screen.dart';
import '../responsive/web_screen_layout.dart';

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

  //read images
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _userController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }


  void signUpUser() async{
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
            email: _emailController.text,
            password: _passwordController.text,
            username: _userController.text,
            bio: _bioController.text, file: _image!
          );
    
    setState(() {
      _isLoading = false;
    });
    if( res != 'success'){
      showSnackBar(context, res);
    }else{
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsvieLayout(
                mobileScreenLayout: MobileScreenLayout(),
                 webScreenLayout: WebScreenLayout(),
              )
        )
      );

    }
  }

  void navigateToSignIn(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const LoginScreen())
    );
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
              _image != null
                  ? CircleAvatar(
                      radius: 64,
                      backgroundImage: MemoryImage(_image!),
                    )
                  : const CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(
                          'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50'),
                    ),
              Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: selectImage,
                    icon: Icon(Icons.add_a_photo),
                  ))
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
          child: const Text('Do you already have an account?'),
        ),
        GestureDetector(
          onTap: navigateToSignIn,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: const Text(
              'Login.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildLoginBtn() {
    return InkWell(
      onTap: signUpUser,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        alignment: Alignment.center,
        decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4))),
            color: blueColor),
        child: _isLoading ? const Center(
          child: CircularProgressIndicator(color: primaryColor,),
        ) : const Text('Sign up'),
      ),
    );
  }
}
