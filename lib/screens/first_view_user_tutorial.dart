import 'dart:async';

import 'package:clinkoin/data/datasource/auth_google_data_source.dart';
import 'package:clinkoin/data/providers/auth_provider.dart';
import 'package:clinkoin/main.dart';
import 'package:clinkoin/models/feature.dart';
import 'package:clinkoin/screens/first_time_user_tutorial_predicted.dart';
import 'package:clinkoin/widgets/draw_graph.dart';
import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'first_time_home_page_wait_for_overlay.dart';

class FirstViewUserTutorial extends StatefulWidget {
  static final routeName = '/FirstViewUserTutorial';

  @override
  _FirstViewUserTutorialState createState() => _FirstViewUserTutorialState();
}

class _FirstViewUserTutorialState extends State<FirstViewUserTutorial> {
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

  // Future testSignIn() async {
  // }

  // @override
  // void didChangeDependencies() {
  //   try {
  //     Provider.of(context)<AuthProvider>(context, listen: false)
  //         .getToken('1234');
  //   } catch (error) {
  //     print(error);
  //   }

  //   super.didChangeDependencies();
  // }

  @override
  void initState() {
    duration = new Duration(hours: hours, seconds: seconds, minutes: minutes);
    errorController = StreamController();
    super.initState();
  }

  double _opacity = 1.0;
  double _fadeIn = 0.0;
  bool _animateScreen = false;
  int _fadeTimer = 400;

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
  CountdownFormatted timer;

  @override
  Widget build(BuildContext context) {
    timer = CountdownFormatted(
      duration: duration,
      onFinish: () {
        // Navigator.of(context)
        //     .pushNamed(FirstTimeHomePageWaitForOverlay.routeName);
      },
      builder: (BuildContext ctx, String remaining) {
        return Text(
          '(ends in ${hours == 0 && minutes == 0 ? '00:00:$remaining' : hours == 0 ? '00:$remaining' : remaining})',
          style: TextStyle(fontSize: MyApp.fourTeen),
        ); // 01:00:00
      },
    );
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * .07),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/bitcoin-small.svg'),
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
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .04,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Will bitcoin go up or down?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              AnimatedOpacity(
                opacity: _opacity,
                //curve: Curves.easeOut,
                duration: Duration(milliseconds: _fadeTimer),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    '(Predict for next 30 Second)',
                    style: TextStyle(
                      fontSize: MyApp.fourTeen,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              _opacity == 1.0
                  ? AnimatedOpacity(
                      opacity: _opacity,
                      //curve: Curves.easeOut,
                      duration: Duration(milliseconds: _fadeTimer),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              '\$ 24,472.971',
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '+4.77%',
                                  style: TextStyle(
                                      color: Color.fromRGBO(41, 162, 135, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '24 Hours',
                                  style: TextStyle(
                                      color: Color.fromRGBO(114, 118, 129, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              SizedBox(
                  height: _opacity == 0.0
                      ? (MediaQuery.of(context).size.height * .08) - 62
                      : (MediaQuery.of(context).size.height * .19) - 62),
              FittedBox(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 17),
                  child: LineGraph(
                    features: features,
                    size: Size(
                        400,
                        MediaQuery.of(context).size.height > 800
                            ? MediaQuery.of(context).size.height * .35
                            : MediaQuery.of(context).size.height * .31),
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
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
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
              ),
              _fadeIn == 0.0
                  ? Container()
                  : AnimatedOpacity(
                      opacity: _fadeIn,
                      duration: Duration(milliseconds: _fadeTimer),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .01,
                          ),
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .05,
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
                                  width:
                                      MediaQuery.of(context).size.width * .05,
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
                                              color: Color.fromRGBO(
                                                  32, 174, 138, 1)),
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
                                  width:
                                      MediaQuery.of(context).size.width * .05,
                                  height:
                                      MediaQuery.of(context).size.height * .15,
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
                          Row(
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
                                    fontSize: MyApp.fourTeen),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                '+220 SATOSHI',
                                style: TextStyle(
                                    color: Color.fromRGBO(248, 157, 46, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: MyApp.fourTeen),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          timer,
                        ],
                      )),
              AnimatedOpacity(
                duration: Duration(
                  milliseconds: _fadeTimer,
                ),
                opacity: _opacity,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
              ),
              Expanded(
                child: AnimatedOpacity(
                  duration: Duration(
                    milliseconds: _fadeTimer,
                  ),
                  opacity: _opacity,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 18),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * .42,
                            child: FlatButton(
                              onPressed: () {
                                // Navigator.of(context).pushNamedAndRemoveUntil(
                                //     FirstViewUserTutorialPredicted.routeName,
                                //     (Route<dynamic> route) => false);
                                setState(() {
                                  _opacity = 0.0;
                                  _fadeIn = 1.0;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Color.fromRGBO(249, 48, 128, 1),
                                  width: 2,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: FittedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        'assets/images/arrow-down.svg'),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Going Down',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(249, 48, 128, 1),
                                          fontSize: MyApp.fourTeen),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * .42,
                            child: FlatButton(
                              onPressed: () {
                                // Navigator.of(context).pushNamed(
                                //     FirstViewUserTutorialPredicted.routeName);
                                setState(() {
                                  _opacity = 0.0;
                                  _fadeIn = 1.0;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Color.fromRGBO(32, 174, 138, 1),
                                  width: 2,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/arrow-up.svg'),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Going Up',
                                    style: TextStyle(
                                        color: Color.fromRGBO(32, 174, 138, 1),
                                        fontSize: MyApp.fourTeen),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: Duration(
                  milliseconds: _fadeTimer,
                ),
                opacity: _opacity,
                child: SizedBox(
                  height: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
