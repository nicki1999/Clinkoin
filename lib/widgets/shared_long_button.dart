import 'package:flutter/material.dart';

class SharedLongButton extends StatelessWidget {
  final String buttonText;
  final Function button;
  SharedLongButton({this.button, this.buttonText});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      margin: EdgeInsets.symmetric(horizontal: 32),
      // margin: EdgeInsets.only(top: MediaQuery.of(context).size.width < 340 ? 10: 20),
      height: 40,
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Color.fromRGBO(41, 114, 255, 1),
        onPressed: () {
          button(context);
        },
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontFamily: Theme.of(context).textTheme.body1.fontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
