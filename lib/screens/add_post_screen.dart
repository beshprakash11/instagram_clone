import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: (){}, 
        icon: const Icon(Icons.upload),
      ),
    );
  }
}