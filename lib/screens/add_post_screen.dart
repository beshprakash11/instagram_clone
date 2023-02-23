import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    /*return Center(
      child: IconButton(
        onPressed: (){}, 
        icon: const Icon(Icons.upload),
      ),
    );*/
    return Scaffold(
      appBar: _buildAppBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: mobileBackgroundColor,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: (){},
      ),
      title: const Text('Post to'),
      centerTitle: false,
      actions: [
        TextButton(
          onPressed: (){}, 
          child: const Text(
            'Post',
            style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
        )
      ],

    );
  }
}