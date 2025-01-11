import 'package:clinkoin/models/feature.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class LineGraphPainter extends CustomPainter {
  final List<Feature> features;
  final List<String> labelX;
  final List<String> labelY;
  final String fontFamily;
  final Color graphColor;
  final double graphOpacity;

  LineGraphPainter({
    @required this.features,
    @required this.labelX,
    @required this.labelY,
    @required this.fontFamily,
    @required this.graphColor,
    @required this.graphOpacity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double _offsetX = 1;
    for (int i = 0; i < labelY.length; i++) {
      if (labelY[i].length > _offsetX) {
        _offsetX = labelY[i].length.toDouble();
      }
    }

    _offsetX *= 7;
    _offsetX += 2 * size.width / 20;
    Size margin = Size(_offsetX, size.height / 8);
    Size margin2 = Size(16, 0);
    Size graph = Size(
      size.width - 1 * margin.width,
      size.height - 2 * margin.height,
    );
    Size cell = Size(
      graph.width / (labelX.length - 1),
      graph.height * 1.58 / labelY.length,
    );
    Size linear = Size(
      graph.width / 60,
      graph.height,
    );

    for (int i = 0; i < features.length; i++) {
      drawGraph(
        features[i],
        canvas,
        graph,
        linear,
        margin2,
      );
    }
    drawAxis(canvas, graph, margin);
    drawLabelsY(canvas, size, margin, graph, cell);
    drawLabelsX(canvas, margin, graph, cell);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void drawAxis(Canvas canvas, Size graph, Size margin) {
    Paint linePaint = Paint()
      ..color = graphColor
      ..strokeWidth = 1;

    Offset xEnd = Offset(graph.width * 1.08, graph.height + margin.height);
    Offset yStart = Offset(margin.width, 0);

    //X-Axis & Y-Axis
    //bottom line
    canvas.drawLine(Offset(margin.width - 70, graph.height + margin.height),
        xEnd, linePaint);
    canvas.drawLine(
        Offset(margin.width - 70, (graph.height + margin.height) / 1.85),
        Offset(graph.width * 1.08, (graph.height + margin.height) / 1.85),
        linePaint);
    canvas.drawLine(
        Offset(margin.width - 70, (graph.height + margin.height) / 10),
        Offset(graph.width * 1.08, (graph.height + margin.height) / 10),
        linePaint);

    //Arrow heads
  }

  void drawLabelsY(
      Canvas canvas, Size size, Size margin, Size graph, Size cell) {
    for (int i = 0; i < labelY.length; i++) {
      TextSpan span = new TextSpan(
        style: new TextStyle(
          fontSize: 11,
          color: Colors.black,
          fontFamily: fontFamily,
        ),
        text: labelY[i],
      );
      TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(
        canvas,
        new Offset(
          size.width / 1.16,
          margin.height + graph.height - (i + .1) * cell.height,
        ),
      );
    }
  }

  void drawLabelsX(Canvas canvas, Size margin, Size graph, Size cell) {
    for (int i = 0; i < labelX.length; i++) {
      TextSpan span = new TextSpan(
        style: new TextStyle(
          fontSize: 11,
          color: Colors.black,
          fontFamily: fontFamily,
        ),
        text: labelX[i],
      );
      TextPainter tp = new TextPainter(
          text: span,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr);
      tp.layout();
      tp.paint(
        canvas,
        new Offset(
          margin.width / 1.1 + cell.width / 1.1 * i - 62,
          margin.height + graph.height + 10,
        ),
      );
    }
  }

  void drawGraph(
      Feature feature, Canvas canvas, Size graph, Size cell, Size margin) {
    Paint fillPaint = Paint()
      // ..color = Colors.red
      // ..style = PaintingStyle.fill;
      ..shader = ui.Gradient.linear(
        Offset(100, 0),
        Offset(100, graph.height),
        [
          Color.fromRGBO(192, 214, 255, 1),
          Colors.white,
        ],
      );
    Paint strokePaint = Paint()
      ..color = Color.fromRGBO(41, 114, 255, 1)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Path path = Path();
    Path linePath = Path();
    path.moveTo(margin.width, graph.height + margin.height);
    path.lineTo(
      margin.width,
      margin.height + graph.height - feature.data[0] * graph.height,
    );
    linePath.moveTo(
      margin.width,
      margin.height + graph.height - feature.data[0] * graph.height + 23,
    );
    int i = 0;
    for (i = 1; i < feature.data.length; i++) {
      if (feature.data[i] > 1) {
        feature.data[i] = 1;
      }
      if (feature.data[i] < 0) {
        feature.data[i] = 0;
      }
      path.lineTo(
        margin.width + i * cell.width - 5,
        margin.height + graph.height - feature.data[i] * graph.height + 16,
      );
      linePath.lineTo(
        margin.width + i * cell.width - 5,
        margin.height + graph.height - feature.data[i] * graph.height + 16,
      );
    }
    // path.lineTo(
    //     margin.width + (feature.data.length - 1) * cell.width, margin.height);
    path.lineTo(
      margin.width + cell.width * (i - 1),
      margin.height + graph.height,
    );
    canvas.drawPath(path, fillPaint);
    canvas.drawPath(linePath, strokePaint);
  }
}
