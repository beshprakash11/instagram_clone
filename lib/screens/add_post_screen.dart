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
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1676030788740-b19c2f441a7f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80'),
              ),
              _buildInputCaption(context),
              _buildRightCaption(),
              const Divider(),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildRightCaption() {
    return SizedBox(
      height: 45,
      width: 45,
      child: AspectRatio(
        aspectRatio: 487 / 451,
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1676030789552-542678bed8d1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80'),
                  fit: BoxFit.fill,
                  alignment: FractionalOffset.topCenter)),
        ),
      ),
    );
  }

  Widget _buildInputCaption(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Write a caption...',
          border: InputBorder.none,
        ),
        maxLines: 8,
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: mobileBackgroundColor,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {},
      ),
      title: const Text('Post to'),
      centerTitle: false,
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Post',
            style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        )
      ],
    );
  }
}
