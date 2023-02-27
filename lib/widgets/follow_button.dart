import 'package:flutter/material.dart';

class FollowButton extends StatelessWidget {
  final Function()? function;
  const FollowButton({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 28),
      child: TextButton(
        onPressed: function, 
        child: fu
      ),
    );
  }
}