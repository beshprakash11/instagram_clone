import 'package:flutter/material.dart';

class CommentCard extends StatefulWidget {
  final snap;
  const CommentCard({super.key, required this.snap});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      child: Row(
        children: [_buildCardAvatar(), _buildUserInfo(), _buildFavorite()],
      ),
    );
  }

  Widget _buildFavorite() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: const Icon(
        Icons.favorite,
        size: 16,
      ),
    );
  }

  Widget _buildUserInfo() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
                text: TextSpan(
              children: [
                TextSpan(
                    text: '${widget.snap['name']}:- ',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
                TextSpan(
                    text: 'Some description to insert',
                    style: const TextStyle(color: Colors.white))
              ],
            )),
            _buildDate()
          ],
        ),
      ),
    );
  }

  Padding _buildDate() {
    return const Padding(
      padding: EdgeInsets.only(top: 4),
      child: Text(
        '22/02/2023',
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
      ),
    );
  }

  Widget _buildCardAvatar() {
    return CircleAvatar(
      backgroundImage: NetworkImage(
          widget.snap['profilePic']
        ),
      radius: 18,
    );
  }
}
