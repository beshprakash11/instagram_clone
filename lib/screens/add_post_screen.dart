import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/models/users.dart';
import 'package:instagram_clone/provider/user_provider.dart';
import 'package:instagram_clone/resources/firestore_methods.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  final TextEditingController _descriptionController = TextEditingController();
  void postImage(
    String uuid,
    String username,
    String profImage
  ) async{
    try {
      String res = await FireStoreMethods().uploadPost(_descriptionController.text, _file!, uuid, username, profImage);
      if (res == "success"){
        showSnackBar(context, 'Posted!');
      }
      
    } catch (err) {
      print(err.toString());   
    }

  }
  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Create a post'),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a Photo'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(
                    ImageSource.camera,
                  );
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from a Galery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(
                    ImageSource.gallery,
                  );
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return _file == null
        ? Center(
            child: IconButton(
              icon: const Icon(Icons.upload),
              onPressed: () => _selectImage(context),
            ),
          )
        : Scaffold(
            appBar: _buildAppBar(),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLeftCaption(
                      user.photoUrl,
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

  Widget _buildLeftCaption(String url) {
    return CircleAvatar(
      backgroundImage: NetworkImage(url),
    );
  }

  Widget _buildRightCaption() {
    return SizedBox(
      height: 45,
      width: 45,
      child: AspectRatio(
        aspectRatio: 487 / 451,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: MemoryImage(_file!),
                  fit: BoxFit.fill,
                  alignment: FractionalOffset.topCenter)),
        ),
      ),
    );
  }

  Widget _buildInputCaption(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: TextField(
        controller: _descriptionController,
        decoration: const InputDecoration(
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
          onPressed: postImage,
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
