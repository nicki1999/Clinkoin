import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:clinkoin/data/providers/auth_provider.dart';
import 'package:clinkoin/main.dart';
import 'package:clinkoin/models/feature.dart';
import 'package:clinkoin/screens/predicted_undo.dart';
import 'package:clinkoin/screens/sign_up.dart';
import 'package:clinkoin/screens/wallet_not_login.dart';
import 'package:clinkoin/widgets/draw_graph.dart';
import 'package:clinkoin/widgets/lose_message.dart';
import 'package:clinkoin/widgets/shared_long_button.dart';
import 'package:clinkoin/widgets/win_message.dart';
import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'feedback.dart';

class FirstTimeHomePageWaitForOverlay extends StatefulWidget {
  static final routeName = '/FirstTimeHomePageWaitForOverlay';

  @override
  _FirstTimeHomePageWaitForOverlayState createState() =>
      _FirstTimeHomePageWaitForOverlayState();
}

final bool _isPredicting = false;

class _FirstTimeHomePageWaitForOverlayState
    extends State<FirstTimeHomePageWaitForOverlay> {
  static final routeName = '/FirstTimeHomePageWaitForOverlay';
  List<bool> checkButton = [true, false, false, false];
  void fCheckButton(int num) {
    setState(() {
      for (var i = 0; i < checkButton.length; i++) {
        checkButton[i] = false;
      }
      checkButton[num] = true;
    });
  }

  double _opacity = 1.0;
  double _fadeIn = 0.0;
  bool _animateScreen = false;
  int _fadeTimer = 400;
  CountdownFormatted timer;

  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  CountDownController _controller = CountDownController();
  int _duration = 3;

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
          setState(() {
            _opacity = 1.0;
            _fadeIn = 0.0;
          });
        },
      ),
    ));
  }

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
  var duration;
  var seconds = 4;
  var minutes = 0;
  var hours = 0;
  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false).firstTime();
    duration = new Duration(hours: hours, seconds: seconds, minutes: minutes);

    print(
        'this is overlay ${Provider.of<AuthProvider>(context, listen: false).isFirstTime}');
    super.initState();
  }

  void _changeScreen(BuildContext context) {
    Navigator.of(context).pop();
    _showModal();
  }

  void _changeScreen2(BuildContext context) {
    Navigator.of(context).pushNamed(SignUp.routeName);
  }

  Future _showModal() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            height: 382,
            color: Color(0xFF737373),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(25.0),
                  topRight: const Radius.circular(25.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 16,
                      right: 16,
                      left: 16,
                    ),
                    alignment: Alignment.centerRight,
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child:
                            SvgPicture.asset('assets/images/dialog-close.svg')),
                  ),
                  SvgPicture.asset('assets/images/alien-no-money.svg'),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Nice Work',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Let’s setup your acccount to continue!',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Text(
                    'You’ll secure your rewards and earn real ',
                    style: TextStyle(fontSize: MyApp.fourTeen),
                  ),
                  Text(
                    'money towards your first investment.',
                    style: TextStyle(fontSize: MyApp.fourTeen),
                  ),
                  Expanded(
                      child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SharedLongButton(
                      button: _changeScreen2,
                      buttonText: 'Sign Up',
                    ),
                  )),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  bool firstTimeFlag = true;
  @override
  void didChangeDependencies() {
    print(MediaQuery.of(context).size.height);

    if (firstTimeFlag == true)
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return WinMessage(
              showModal: _changeScreen,
            );
          },
        );
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return LoseMessage(
              showModal: _changeScreen,
            );
          },
        );
      });
    setState(() {
      firstTimeFlag = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    timer = CountdownFormatted(
      duration: duration,
      onFinish: () {
        setState(() {
          _opacity = 1.0;
          _fadeIn = 0.0;
        });
      },
      builder: (BuildContext ctx, String remaining) {
        return Text(
          '(ends in ${hours == 0 && minutes == 0 ? '00:00:$remaining' : hours == 0 ? '00:$remaining' : remaining})',
          style: TextStyle(fontSize: MyApp.fourTeen),
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
                  InkWell(
                    onTap: () => Navigator.of(context)
                        .pushNamed(WalletNotLogin.routeName),
                    child: Row(
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
                  ),
                  InkWell(
                    child: SvgPicture.asset('assets/images/feedback.svg'),
                    onTap: () =>
                        Navigator.of(context).pushNamed(FeedBack.routeName),
                  ),
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
                  Column(
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
                        height: 4,
                      ),
                      AnimatedOpacity(
                        opacity: _opacity,
                        //curve: Curves.easeOut,
                        duration: Duration(milliseconds: _fadeTimer),
                        child: Text(
                          '(Predict for next 30 Second)',
                          style: TextStyle(
                            fontSize: MyApp.fourTeen,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _opacity == 0
                            ? 0
                            : MediaQuery.of(context).size.height * .03,
                      ),
                      _opacity == 1
                          ? AnimatedOpacity(
                              opacity: _opacity,
                              duration: Duration(milliseconds: _fadeTimer),
                              child: Column(
                                children: [
                                  Text(
                                    '\$ 24,472.971',
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '+4.77%',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(41, 162, 135, 1),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        '24 Hours',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                114, 118, 129, 1),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: _opacity == 0
                            ? (MediaQuery.of(context).size.height * .09) - 62
                            : MediaQuery.of(context).size.height * .033,
                      )
                    ],
                  ),

                  // SizedBox(
                  //     height: (MediaQuery.of(context).size.height * .15) - 62),
                  FittedBox(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
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
                    height: MediaQuery.of(context).size.height * .015,
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
                              fontSize: MyApp.twelve,
                            ),
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

                  _fadeIn == 0.0
                      ? Container()
                      : AnimatedOpacity(
                          opacity: _fadeIn,
                          duration: Duration(milliseconds: _fadeTimer),
                          child: Column(
                            children: [
                              FittedBox(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .05,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'Price at Forecast',
                                          style: TextStyle(
                                              fontSize: MyApp.twelve,
                                              color: Color.fromRGBO(
                                                  81, 81, 81, 1)),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          '\$ 23,472.97',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24,
                                              color: Color.fromRGBO(
                                                  81, 81, 81, 1)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .05,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'Current Price',
                                          style: TextStyle(
                                              fontSize: MyApp.twelve,
                                              color: Color.fromRGBO(
                                                  81, 81, 81, 1)),
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
                                      width: MediaQuery.of(context).size.width *
                                          .05,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .12,
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
                                    SvgPicture.asset(
                                        'assets/images/green-tick.svg'),
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
                                            color:
                                                Color.fromRGBO(248, 157, 46, 1),
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
                  Expanded(
                    child: AnimatedOpacity(
                      duration: Duration(
                        milliseconds: 0,
                      ),
                      opacity: _opacity,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * .41,
                              child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    _opacity = 0.0;
                                    _fadeIn = 1.0;
                                  });
                                  // Navigator.of(context)
                                  //     .pushNamed(PredictedUndo.routeName);
                                  Future.delayed(const Duration(seconds: 0))
                                      .then((_) => _buildSnackBar());
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
                              width: MediaQuery.of(context).size.width * .41,
                              child: FlatButton(
                                onPressed: () {
                                  Future.delayed(const Duration(seconds: 0))
                                      .then((_) => _buildSnackBar());
                                  setState(() {
                                    _opacity = 0.0;
                                    _fadeIn = 1.0;
                                  });
                                  // Navigator.of(context)
                                  //     .pushNamed(PredictedUndo.routeName);
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
                                          color:
                                              Color.fromRGBO(32, 174, 138, 1),
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
                  SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
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
                          disabledElevation: 0,
                          disabledColor: Color.fromRGBO(226, 226, 226, 1),
                          elevation: 0,
                          focusElevation: 0,
                          hoverElevation: 0,
                          splashColor: Color.fromRGBO(226, 226, 226, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onPressed: null,
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
