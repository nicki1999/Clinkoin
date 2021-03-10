import 'package:clinkoin/widgets/shared_long_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class LoseMessage extends StatelessWidget {
  void _changeScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.only(right: 16, left: 16, bottom: 24),
        width: MediaQuery.of(context).size.width * 1,
        height: 570,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 16),
              alignment: Alignment.centerRight,
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset('assets/images/dialog-close.png')),
            ),
            Image.asset('assets/images/sad-alien.png'),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Text(
              'Opps!',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: MyApp.twentyOne),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            Text(
              'You incorrectly predicted',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: ' that Bitcoin would go',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                      text: ' up',
                      style: TextStyle(
                          color: Color.fromRGBO(32, 174, 138, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16))
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 26, vertical: 11),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(217, 217, 217, 1),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Bitcoin went down ',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextSpan(
                        text: '\$667.55',
                        style: TextStyle(
                            color: Color.fromRGBO(249, 48, 128, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 16))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .05,
                  ),
                  Column(
                    children: [
                      Text(
                        'Price at Forecast',
                        style: TextStyle(
                            fontSize: 14, color: Color.fromRGBO(81, 81, 81, 1)),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '\$ 23,472.97',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color.fromRGBO(81, 81, 81, 1)),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .05,
                  ),
                  Column(
                    children: [
                      Text(
                        'Current Price',
                        style: TextStyle(
                            fontSize: 14, color: Color.fromRGBO(81, 81, 81, 1)),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            '\$ 24,472.97',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Color.fromRGBO(249, 48, 128, 1),
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Container(
                            child: Image.asset('assets/images/red-polygon.png'),
                            margin: EdgeInsets.only(top: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .05,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'You incorrectly predicted, win next time',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SharedLongButton(
                        button: _changeScreen,
                        buttonText: 'Predict Again',
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
