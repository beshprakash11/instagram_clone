import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: _buildBottomNavbar(context),
      body: Center(
        child: const Text("Commet Screen"),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: mobileBackgroundColor,
      title: const Text('Comments'),
      centerTitle: false,
    );
  }

  Widget _buildBottomNavbar(BuildContext context) {
    return SafeArea(
      child: Container(
        height: kToolbarHeight,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom
        ),
        padding: const EdgeInsets.only(
          left: 16,
          right: 8
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1589180176337-503fed4bcfe0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80'),
              radius: 18,
            ), 
            
            TextField(
              decoration: InputDecoration(
                hintText: 'Comment as username',
                border: InputBorder.none
              ),
            ),
          ],
        ),
      ),
    );
  }
}