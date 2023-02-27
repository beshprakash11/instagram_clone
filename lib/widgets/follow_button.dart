import 'package:flutter/material.dart';

class FollowButton extends StatelessWidget {
  final Function()? function;
  final Color backgroundColor;
  final Color borderColor;
  const FollowButton({
    super.key, 
    required this.function, 
    required this.backgroundColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 28),
      child: TextButton(
        onPressed: function, 
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(

            )
          ),
        )
      ),
    );
  }
}