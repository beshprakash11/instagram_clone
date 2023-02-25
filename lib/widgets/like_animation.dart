import 'package:flutter/material.dart';

class LikeAnimation extends StatefulWidget {
  final Widget child;
  final bool isAnimating;
  final Duration duration;
  final VoidCallback? onEnd;
  final bool smalllike;
  const LikeAnimation({
    Key? key, 
    required this.child,
    required this.isAnimating,
    this.duration = const Duration(microseconds: 150),
    this.onEnd,
    this.smalllike = false
  }) : super(key: key);

  @override
  State<LikeAnimation> createState() => _LikeAnimationState();
}

class _LikeAnimationState extends State<LikeAnimation> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this, 
      // divide provided miliseconds by 2 and convert it to integer
      duration: Duration(microseconds: widget.duration.inMilliseconds ~/ 2),
    );
    scale = Tween<double>(begin: 1, end: 1.2).animate(controller);

  }

  @override
  void didUpdateWidget(covariant LikeAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(widget.isAnimating != oldWidget.isAnimating){
      startAnimation();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}