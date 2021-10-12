import 'package:flutter/material.dart';

class LinearPercentIndicator extends StatelessWidget {
  final double percent;
  final double? width;
  final double lineHeight;
  final Color fillColor;
  final Color backgroundColor;
  final Color? progressColor;
  final EdgeInsets padding;
  LinearPercentIndicator({
    Key? key,
    this.fillColor = Colors.transparent,
    this.percent = 0.0,
    this.lineHeight = 5.0,
    this.width,
    this.backgroundColor = const Color(0xFFB8C7CB),
    this.progressColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 10.0),
  }) : super(key: key) {
    if (percent < 0.0 || percent > 1.0) {
      throw new Exception("Percent value must be a double between 0.0 and 1.0");
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    final hasSetWidth = width != null;
    var containerWidget = Container(
      width: hasSetWidth ? width : double.infinity,
      height: lineHeight,
      padding: padding,
      child: CustomPaint(
        painter: LinearPainter(
          progress: percent,
          progressColor: progressColor!,
          backgroundColor: backgroundColor,
          lineWidth: lineHeight,
        ),
      ),
    );

    if (hasSetWidth) {
      items.add(containerWidget);
    } else {
      items.add(Expanded(
        child: containerWidget,
      ));
    }

    return Material(
      color: Colors.transparent,
      child: new Container(
          color: fillColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: items,
          )),
    );
  }
}

class LinearPainter extends CustomPainter {
  final Paint _paintBackground = new Paint();
  final Paint _paintLine = new Paint();
  final lineWidth;
  final progress;
  final Color progressColor;
  final Color backgroundColor;

  LinearPainter({
    this.lineWidth,
    this.progress,
    required this.progressColor,
    required this.backgroundColor,
  }) {
    _paintBackground.color = backgroundColor;
    _paintBackground.style = PaintingStyle.stroke;
    _paintBackground.strokeWidth = lineWidth;
    _paintLine.color = progress.toString() == "0.0"
        ? progressColor.withOpacity(0.0)
        : progressColor;
    _paintLine.style = PaintingStyle.stroke;
    _paintLine.strokeWidth = lineWidth;

    _paintLine.strokeCap = StrokeCap.round;
    _paintBackground.strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final start = Offset(0.0, size.height / 2);
    final end = Offset(size.width, size.height / 2);
    canvas.drawLine(start, end, _paintBackground);

    final xProgress = size.width * progress;

    canvas.drawLine(start, Offset(xProgress, size.height / 2), _paintLine);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
