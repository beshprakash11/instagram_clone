import 'package:flutter/material.dart';

class CommentCard extends StatefulWidget {
  const CommentCard({super.key});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      child: Row(
        children: [
          _buildCardAvatar(),
          _buildUserInfo(),
        ],
      ),
    );
  }

  Padding _buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(text: TextSpan(text: 'username', style: const TextStyle(fontWeight: FontWeight.bold))),
          RichText(text: TextSpan(text: 'Some description to insert')),
        ],
      ),
    );
  }

  Widget _buildCardAvatar() {
    return const CircleAvatar(
      backgroundImage: NetworkImage(
          'https://images.unsplash.com/photo-1627921227616-3e7d92a17dcb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
      radius: 18,
    );
  }
}
