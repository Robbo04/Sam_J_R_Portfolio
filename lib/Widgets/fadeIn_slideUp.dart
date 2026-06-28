import 'package:flutter/material.dart';

class FadeSlide extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const FadeSlide({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 700),
  });

  @override
  State<FadeSlide> createState() => _FadeSlideState();
}

class _FadeSlideState extends State<FadeSlide> {
  double opacity = 0.0;
  double offset = 20.0; // starting downward offset

  @override
  void initState() {
    super.initState();

    // Trigger animation after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        opacity = 1.0;
        offset = 0.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: widget.duration,
      curve: Curves.easeOut,
      opacity: opacity,
      child: AnimatedSlide(
        duration: widget.duration,
        curve: Curves.easeOut,
        offset: Offset(0, offset / 100),
        child: widget.child,
      ),
    );
  }
}