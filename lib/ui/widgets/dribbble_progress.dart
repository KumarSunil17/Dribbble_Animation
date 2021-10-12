import 'package:flutter/material.dart';
import 'dart:math' as Math;

const kProgressBarSize = Size(60, 60);

class DribbbleProgress extends StatefulWidget {
  final Color color;
  final double strokeWidth;
  const DribbbleProgress({
    Key? key,
    required this.strokeWidth,
    required this.color,
  }) : super(key: key);

  @override
  _DribbbleProgressState createState() => _DribbbleProgressState();
}

class _DribbbleProgressState extends State<DribbbleProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    this._controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    this._controller.repeat();
  }

  @override
  void dispose() {
    this._controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: kProgressBarSize,
      child: AspectRatio(
        aspectRatio: 1,
        child: AnimatedBuilder(
          animation: this._controller,
          builder: (ctx, child) => CustomPaint(
            child: Container(),
            foregroundPainter: CircleProgressBarPainter(
                color: widget.color,
                percentage: Tween<double>(begin: 0.0, end: 1.0)
                    .animate(CurvedAnimation(
                        curve: Curves.fastOutSlowIn, parent: _controller))
                    .value,
                strokeWidth: this.widget.strokeWidth),
          ),
        ),
      ),
    );
  }
}

class CircleProgressBarPainter extends CustomPainter {
  final double percentage;
  final double strokeWidth;
  final Color color;

  CircleProgressBarPainter({
    required this.color,
    required this.percentage,
    double strokeWidth = 6,
  }) : this.strokeWidth = strokeWidth ?? 6;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = size.center(Offset.zero);

    final shortestSide = Math.min(size.width, size.height);
    final foregroundPaint = Paint()
      ..color = this.color
      ..strokeWidth = this.strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final radius = (shortestSide / 2) - (this.strokeWidth / 2).ceil();

    final double startAngle = 2 * Math.pi * percentage;

    final count = 8;
    final gapSize = 20;
    final double gap = Math.pi / 180 * gapSize;
    final double singleAngle = (Math.pi * 2) / count;

    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth - 2
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    for (int i = 0; i < count; i++) {
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
          gap + singleAngle * i, singleAngle - gap * 2, false, paint);
    }
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      singleAngle - gap * 5,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    final oldPainter = (oldDelegate as CircleProgressBarPainter);
    return oldPainter.percentage != this.percentage;
  }
}
