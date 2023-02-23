import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  _selectImage(BuildContext context) async{
    return showDialog(context: context, builder: (context){
      return SimpleDialog(
        title: const Text('Create a post'),
        children: [
          SimpleDialogOption(
            padding: EdgeInsets.all(20),
            child: const Text('Take a Photo'),
            onPressed: () async{
              Navigator.of(context).pop();
              Uint8List file = await pickImage(ImageSource.camera,);
            },
          )
        ],
      );
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLeftCaption(),
              _buildInputCaption(context),
              _buildRightCaption(),
              const Divider(),
            ],
          )
        ],
      ),
    );
  }

  CircleAvatar _buildLeftCaption() {
    return const CircleAvatar(
      backgroundImage: NetworkImage(
          'https://images.unsplash.com/photo-1676030788740-b19c2f441a7f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80'),
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
