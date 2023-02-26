import 'package:flutter/material.dart';
import 'package:instagram_clone/models/users.dart';
import 'package:instagram_clone/provider/user_provider.dart';
import 'package:instagram_clone/resources/firestore_methods.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/comment_card.dart';
import 'package:provider/provider.dart';

class CommentScreen extends StatefulWidget {
  final snap;
  const CommentScreen({
    Key? key, 
    required this.snap
  }) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _commentController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: _buildBottomNavbar(context, user.photoUrl, user.username, user.uid),
      body: CommentCard(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: mobileBackgroundColor,
      title: const Text('Comments'),
      centerTitle: false,
    );
  }

  Widget _buildBottomNavbar(BuildContext context, String photoUrl, String username, userId) {
    return SafeArea(
      child: Container(
        height: kToolbarHeight,
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        padding: const EdgeInsets.only(left: 16, right: 8),
        child: Row(
          children: [
            _buildCircularAvatar(photoUrl),
            _buildCommentUser(username),
            _buildPostBtn(userId, username, photoUrl)
          ],
        ),
      ),
    );
  }

  Widget _buildPostBtn(String userId, String username, String photoUrl) {
    return InkWell(
      onTap: () async{
        await FireStoreMethods().postComment(
          widget.snap['postId'], 
          _commentController.text, 
          userId, 
          username, 
          photoUrl
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: const Text('Post', style: TextStyle(color: blueColor)),
      ),
    );
  }

  Widget _buildCommentUser(String username) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 8.0),
        child: TextField(
          controller: _commentController,
          decoration: InputDecoration(
              hintText: 'Comment as ${username}', border: InputBorder.none),
        ),
      ),
    );
  }

  Widget _buildCircularAvatar(String photoUrl) {
    return CircleAvatar(
      backgroundImage: NetworkImage(
        photoUrl
      ),
      radius: 18,
    );
  }
}
