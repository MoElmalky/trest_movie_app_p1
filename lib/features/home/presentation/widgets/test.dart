import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingTextAnimation extends StatefulWidget {
  const LoadingTextAnimation({super.key});

  @override
  State<LoadingTextAnimation> createState() => _LoadingTextAnimationState();
}

class _LoadingTextAnimationState extends State<LoadingTextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
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
    return ClipRect(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
                5, (index) => _buildTextLine(Colors.transparent, Colors.blue)),
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return CustomPaint(
                size: Size(200, 150), // Size of the entire text block
                painter: DiagonalLinePainter(animationValue: _animation.value),
              );
            },
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              ...List.generate(5,
                  (index) => _buildTextLine(Colors.black, Colors.transparent)),

            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextLine(Color color1, Color color2) {
    return Column(children: [
      Container(
        width: 200,
        height: 10,
        color: color1,
      ),
      Container(
        width: 200,
        height: 20,
        color: color2,
      ),
    ]);
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
        colors: [Colors.transparent, Colors.white, Colors.transparent],
        stops: [
          animationValue - 0.1,
          animationValue,
          animationValue + 0.1,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
