import 'package:flutter/material.dart';

class Feature {
  String title;
  LinearGradient color;
  List<double> data;

  Feature({
    this.title = "",
    this.color,
    @required this.data,
  });
}
