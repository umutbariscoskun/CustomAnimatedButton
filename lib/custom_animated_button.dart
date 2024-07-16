library custom_animated_button;

import 'package:flutter/material.dart';

/// Easy to use animated button
/// You can wrap your widgets converting an animated button
/// For example for basic usage:
/// ```
///CustomAnimatedButton(
///
///       child: Container(width: 200,
///        height: 100,
///       decoration: BoxDecoration(
///        color: Colors.green,
///         borderRadius: BorderRadius.circular(20)
///      ),
///      ),
///   )
///```
class CustomAnimatedButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const CustomAnimatedButton({
    super.key,
    required this.child,
    this.onPressed,
  });

  @override
  AnimatedButtonState createState() => AnimatedButtonState();
}

class AnimatedButtonState extends State<CustomAnimatedButton>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ).drive(Tween<double>(begin: 1.0, end: 0.9));

    _animation.addListener(() {
      setState(() {
        _scale = _animation.value;
      });
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _scale = 1.0;
        });
      }
    });
  }

  void _onTap() {
    _controller.forward().then((_) {
      if (widget.onPressed != null) {
        widget.onPressed!();
      } else {
        _controller.reset();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }
}
