import 'package:flutter/material.dart';

class LoadingAnimation2 extends StatefulWidget {
  const LoadingAnimation2({super.key});

  @override
  State<LoadingAnimation2> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation2>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: false);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            width: 300,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: CustomPaint(
              painter: DiagonalLinePainter(animationValue: _animation.value),
            ),
          );
        },
      ),
    );
  }
}

class DiagonalLinePainter extends CustomPainter {
  final double animationValue;

  DiagonalLinePainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.transparent, Colors.white38, Colors.transparent],
        stops: [
          animationValue - .1,
          animationValue,
          animationValue + .1,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width*2, size.height*2));

    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}