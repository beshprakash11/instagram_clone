import 'package:flutter/material.dart';
import 'package:instagram_clone/models/users.dart';
import 'package:instagram_clone/provider/user_provider.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/comment_card.dart';
import 'package:provider/provider.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: _buildBottomNavbar(context, user.photoUrl),
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

  Widget _buildBottomNavbar(BuildContext context, String photoUrl) {
    return SafeArea(
      child: Container(
        height: kToolbarHeight,
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        padding: const EdgeInsets.only(left: 16, right: 8),
        child: Row(
          children: [
            _buildCircularAvatar(photoUrl),
            _buildCommentUser(),
            _buildPostBtn()
          ],
        ),
      ),
    );
  }

  Widget _buildPostBtn() {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: const Text('Post', style: TextStyle(color: blueColor)),
      ),
    );
  }

  Widget _buildCommentUser(String username) {
    return const Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 8.0),
        child: TextField(
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
