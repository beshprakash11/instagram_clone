import 'package:flutter/material.dart';

class LikeAnimation extends StatefulWidget {
  const LikeAnimation({super.key});

  @override
  State<LikeAnimation> createState() => _LikeAnimationState();
}

class _LikeAnimationState extends State<LikeAnimation> with SingleTickerProviderStateMixin{
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(microseconds: ));
  }
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}