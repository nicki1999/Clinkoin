import 'package:flutter/material.dart';

class TimeButton extends StatefulWidget {
  @override
  _TimeButtonState createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        '1D',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      style: TextButton.styleFrom(
        backgroundColor: Color.fromRGBO(232, 237, 255, 1),
        primary: Color.fromRGBO(150, 158, 179, 1),
      ),
    );
  }
}
