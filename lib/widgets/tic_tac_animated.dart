import 'package:flutter/material.dart';

class TicTacAnimated extends StatefulWidget {
  final Duration duration;
  final CustomPainter painter;
  const TicTacAnimated(
      {super.key, required this.duration, required this.painter});

  @override
  State<TicTacAnimated> createState() => _TicTacAnimatedState();
}

class _TicTacAnimatedState extends State<TicTacAnimated>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> positionAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: widget.duration);

    positionAnimation = TweenSequence<double>(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 50), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 30), weight: 50),
    ]).animate(controller);

    controller.forward();

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.repeat();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Padding(
          padding: EdgeInsets.only(top: positionAnimation.value),
          child: CustomPaint(
            size: const Size(50, 50),
            painter: widget.painter,
          ),
        );
      },
    );
  }
}
