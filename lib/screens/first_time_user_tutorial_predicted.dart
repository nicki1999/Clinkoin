import 'dart:async';

import 'package:clinkoin/main.dart';
import 'package:clinkoin/widgets/shared_long_button.dart';
import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstViewUserTutorialPredicted extends StatefulWidget {
  static final routeName = '/FirstTimeUserTutorialPredicted';

  @override
  _FirstViewUserTutorialPredictedState createState() =>
      _FirstViewUserTutorialPredictedState();
}

class _FirstViewUserTutorialPredictedState
    extends State<FirstViewUserTutorialPredicted> {
  bool goingUp = false;
  var seconds = 2;
  var minutes = 0;
  var hours = 0;
  var duration;
  StreamController errorController;
  List<bool> checkButton = [true, false, false, false];
  void fCheckButton(int num) {
    setState(() {
      for (var i = 0; i < checkButton.length; i++) {
        checkButton[i] = false;
      }
      checkButton[num] = true;
    });
  }

  @override
  void initState() {
    duration = new Duration(hours: hours, seconds: seconds, minutes: minutes);
    errorController = StreamController();

    super.initState();
  }

  CountdownFormatted timer;

  @override
  Widget build(BuildContext context) {
    void _changeScreen() {}
    Future showModal() {
      return showDialog(
        context: context,
        builder: (context) {
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
                  Image.asset('assets/images/alien.png'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  Text(
                    'Success!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: MyApp.twentyOne),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  Text(
                    'You correctly predicted',
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
                            text: 'Bitcoin went up ',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          TextSpan(
                              text: '\$667.55',
                              style: TextStyle(
                                  color: Color.fromRGBO(32, 174, 138, 1),
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
                                  fontSize: 14,
                                  color: Color.fromRGBO(81, 81, 81, 1)),
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
                                  fontSize: 14,
                                  color: Color.fromRGBO(81, 81, 81, 1)),
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
                                      color: Color.fromRGBO(32, 174, 138, 1)),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Container(
                                  child: Image.asset(
                                      'assets/images/green-polygon.png'),
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
                                    'You are currently gaining',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text('+220 SATOSHI',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(248, 157, 46, 1),
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            FittedBox(
                              child: SharedLongButton(
                                button: _changeScreen,
                                buttonText: 'Onward & Upwards',
                              ),
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
        },
      );
    }

    timer = CountdownFormatted(
      duration: duration,
      onFinish: () {
        showModal();
      },
      builder: (BuildContext ctx, String remaining) {
        return Text(
            '(ends in ${hours == 0 && minutes == 0 ? '00:00:$remaining' : hours == 0 ? '00:$remaining' : remaining})'); // 01:00:00
      },
    );
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .1),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/bitcoin-small.png',
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'Bitcoin (BTC)',
                  style: TextStyle(
                      fontSize: MyApp.twentyOne, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Text(
              'Will bitcoin go up or down?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: (MediaQuery.of(context).size.height * .15) - 62),
            Container(
              height: MediaQuery.of(context).size.height * .35,
              width: MediaQuery.of(context).size.width * 1,
              color: Colors.blue,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .05,
                  ),
                  TextButton(
                    onPressed: () {
                      fCheckButton(0);
                    },
                    child: Text(
                      '1H',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: checkButton[0]
                          ? Color.fromRGBO(41, 114, 255, 1)
                          : Color.fromRGBO(232, 237, 255, 1),
                      primary: checkButton[0]
                          ? Colors.white
                          : Color.fromRGBO(150, 158, 179, 1),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .05,
                  ),
                  TextButton(
                    onPressed: () {
                      fCheckButton(1);
                    },
                    child: Text(
                      '1D',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: checkButton[1]
                          ? Color.fromRGBO(41, 114, 255, 1)
                          : Color.fromRGBO(232, 237, 255, 1),
                      primary: checkButton[1]
                          ? Colors.white
                          : Color.fromRGBO(150, 158, 179, 1),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .05,
                  ),
                  TextButton(
                    onPressed: () {
                      fCheckButton(2);
                    },
                    child: Text(
                      '1W',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: checkButton[2]
                          ? Color.fromRGBO(41, 114, 255, 1)
                          : Color.fromRGBO(232, 237, 255, 1),
                      primary: checkButton[2]
                          ? Colors.white
                          : Color.fromRGBO(150, 158, 179, 1),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .05,
                  ),
                  TextButton(
                    onPressed: () {
                      fCheckButton(3);
                    },
                    child: Text(
                      '1M',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: checkButton[3]
                          ? Color.fromRGBO(41, 114, 255, 1)
                          : Color.fromRGBO(232, 237, 255, 1),
                      primary: checkButton[3]
                          ? Colors.white
                          : Color.fromRGBO(150, 158, 179, 1),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .05,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * .05),
                    height: 35,
                    width: 1,
                    color: Color.fromRGBO(210, 210, 211, 1),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.asset('assets/images/blue-chart.png'),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Watch Live',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(41, 114, 255, 1)),
                        ),
                      ],
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromRGBO(223, 230, 255, 1),
                      primary: Color.fromRGBO(150, 158, 179, 1),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .05,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
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
                                color: Color.fromRGBO(32, 174, 138, 1)),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Container(
                            child:
                                Image.asset('assets/images/green-polygon.png'),
                            margin: EdgeInsets.only(top: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .05,
                    height: MediaQuery.of(context).size.height * .13,
                  ),
                ],
              ),
            ),
            Text('You selected Going Up'),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/green-tick.png'),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'You are currently gaining',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 6,
                ),
                Text('+220 SATOSHI',
                    style: TextStyle(
                        color: Color.fromRGBO(248, 157, 46, 1),
                        fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            timer,
          ],
        ),
      ),
    );
  }
}
