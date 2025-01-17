import 'package:flutter/material.dart';

class AppSlideFadeAnimation extends StatefulWidget {
  final double begin;
  final Widget child;

  const AppSlideFadeAnimation({
    super.key,
    required this.begin,
    required this.child,
  });

  @override
  State<AppSlideFadeAnimation> createState() => _AppSlideFadeAnimationState();
}



class _AppSlideFadeAnimationState extends State<AppSlideFadeAnimation>
    with TickerProviderStateMixin {
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _animationController();
    _slideAnimationController();
    _fadeAnimationController();
  }

  void _animationController() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..forward();
  }

  void _slideAnimationController() {
    _slideAnimation = Tween<Offset>(
            begin: Offset(widget.begin, 0.0), end: const Offset(0.0, 0.0))
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void _fadeAnimationController() {
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
