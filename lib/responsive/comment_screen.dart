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
            
          ],
        ),
      ),
    );
  }
}