import 'dart:async';

import 'package:clinkoin/models/feature.dart';
import 'package:clinkoin/widgets/draw_graph.dart';
import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter_svg/svg.dart';

import '../main.dart';
import 'first_time_home_page_wait_for_overlay.dart';
import 'home_page.dart';

class PredictedUndo extends StatefulWidget {
  static final routeName = '/PredictedUndo';
  @override
  _PredictedUndoState createState() => _PredictedUndoState();
}

class _PredictedUndoState extends State<PredictedUndo> {
  CountDownController _controller = CountDownController();
  int _duration = 3;
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  List<bool> checkButton = [true, false, false, false];
  void fCheckButton(int num) {
    setState(() {
      for (var i = 0; i < checkButton.length; i++) {
        checkButton[i] = false;
      }
      checkButton[num] = true;
    });
  }

  var seconds = 4;
  var minutes = 0;
  var hours = 0;
  var duration;
  StreamController errorController;
  CountdownFormatted timer;
  final List<Feature> features = [
    Feature(
      color: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Colors.purple, Colors.blue],
      ),
      data: [0.2, 0.8, 0.4, 0.7, 0.6],
    ),
  ];
  @override
  void initState() {
    duration = new Duration(hours: hours, seconds: seconds, minutes: minutes);
    errorController = StreamController();

    super.initState();
    new Future.delayed(const Duration(seconds: 0))
        .then((_) => _buildSnackBar());
  }

  _buildSnackBar() {
    key.currentState.showSnackBar(new SnackBar(
      onVisible: () => _controller.start(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      backgroundColor: Colors.black,
      duration: Duration(seconds: 3),
      content: Row(
        children: [
          CircularCountDownTimer(
            duration: _duration,
            initialDuration: 0,
            controller: _controller,
            width: 25,
            height: 25,
            ringColor: Color.fromRGBO(41, 114, 255, 1),
            ringGradient: null,
            fillColor: Colors.white,
            fillGradient: null,
            backgroundColor: Colors.black,
            backgroundGradient: null,
            strokeWidth: 2.0,
            strokeCap: StrokeCap.round,
            textStyle: TextStyle(
                fontSize: MyApp.twelve,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            textFormat: CountdownTextFormat.S,
            isReverse: true,
            isReverseAnimation: false,
            isTimerTextShown: true,
            autoStart: false,
            onStart: () {},
            onComplete: () {},
          ),
          SizedBox(
            width: 13,
          ),
          new Text("You Choosed",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: MyApp.twelve)),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: 'Undo',
        textColor: Color.fromRGBO(41, 114, 255, 1),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    timer = CountdownFormatted(
      duration: duration,
      onFinish: () {
        Navigator.of(context).pushNamedAndRemoveUntil(
            HomePage.routeName, ModalRoute.withName(HomePage.routeName),
            arguments: {'showModal': true});
      },
      builder: (BuildContext ctx, String remaining) {
        return Text(
          '(ends in ${hours == 0 && minutes == 0 ? '00:00:$remaining' : hours == 0 ? '00:$remaining' : remaining})',
          style: TextStyle(fontSize: MyApp.twelve),
        ); // 01:00:00
      },
    );
    return Scaffold(
      key: key,
      backgroundColor: Color.fromRGBO(245, 245, 253, 1),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              height: MediaQuery.of(context).size.height * .08,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  bottomLeft: const Radius.circular(10.0),
                  bottomRight: const Radius.circular(10.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/images/bitcoin-medium.svg'),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '220 SATOSHI',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MyApp.fourTeen),
                      ),
                      SizedBox(width: 5),
                      SvgPicture.asset('assets/images/question-icon.svg'),
                    ],
                  ),
                  SvgPicture.asset('assets/images/profile.svg'),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              height: MediaQuery.of(context).size.height * .77,
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/bitcoin-small.svg',
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Bitcoin (BTC)',
                        style: TextStyle(
                            fontSize: MyApp.twentyOne,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  Text(
                    'Will bitcoin go up or down?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                      height: (MediaQuery.of(context).size.height * .09) - 62),
                  FittedBox(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: LineGraph(
                        features: features,
                        size: Size(
                            400,
                            MediaQuery.of(context).size.height > 800
                                ? MediaQuery.of(context).size.height * .38
                                : MediaQuery.of(context).size.height * .32),
                        labelX: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5'],
                        labelY: [
                          '\$24,000',
                          '60%',
                          '100%',
                        ],
                        showDescription: false,
                        graphColor: Color.fromRGBO(210, 210, 210, 1),
                      ),
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
                        TextButton(
                          onPressed: () {
                            fCheckButton(0);
                          },
                          child: Text(
                            '1H',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: MyApp.twelve),
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: MyApp.twelve),
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: MyApp.twelve),
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: MyApp.twelve),
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
                              SvgPicture.asset('assets/images/blue-chart.svg'),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Watch Live',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(41, 114, 255, 1),
                                    fontSize: MyApp.twelve),
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
                                  fontSize: MyApp.twelve,
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
                                  fontSize: MyApp.twelve,
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
                                  child: SvgPicture.asset(
                                      'assets/images/green-polygon.svg'),
                                  margin: EdgeInsets.only(top: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .05,
                          height: MediaQuery.of(context).size.height * .12,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'You selected Going Up',
                    style: TextStyle(fontSize: MyApp.fourTeen),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/green-tick.svg'),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'You are currently gaining',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: MyApp.twelve),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text('+220 SATOSHI',
                            style: TextStyle(
                                color: Color.fromRGBO(248, 157, 46, 1),
                                fontSize: MyApp.twelve,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  timer,
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
                  height: MediaQuery.of(context).size.height * .08,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topRight: const Radius.circular(10.0),
                      topLeft: const Radius.circular(10.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 2),
                          child: Row(
                            children: [
                              Image.asset('assets/images/cup.png'),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Global Battle',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: MyApp.twentyOne),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FittedBox(
                        child: RaisedButton(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          color: Color.fromRGBO(180, 206, 255, 1),
                          onPressed: () => null,
                          child: Text(
                            'Coming Soon!',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
