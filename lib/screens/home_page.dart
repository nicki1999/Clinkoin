import 'package:clinkoin/models/feature.dart';
import 'package:clinkoin/screens/feedback.dart';
import 'package:clinkoin/screens/predicted_undo.dart';
import 'package:clinkoin/screens/wallet_not_login.dart';
import 'package:clinkoin/widgets/draw_graph.dart';
import 'package:clinkoin/widgets/lose_message.dart';
import 'package:clinkoin/widgets/shared_long_button.dart';
import 'package:clinkoin/widgets/win_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  static final routeName = '/HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<bool> checkButton = [true, false, false, false];
  void fCheckButton(int num) {
    setState(() {
      for (var i = 0; i < checkButton.length; i++) {
        checkButton[i] = false;
      }
      checkButton[num] = true;
    });
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
  void _changeScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = (ModalRoute.of(context).settings.arguments as Map);

      if (args['showModal'] == true)
        showDialog(
          context: context,
          builder: (context) {
            return LoseMessage(showModal: _changeScreen);
          },
        );
      showDialog(
        context: context,
        builder: (context) {
          return WinMessage(
            showModal: _changeScreen,
          );
        },
      );
    });
    print('this is homepage');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      onTap: () =>
                          Navigator.of(context).pushNamed(FeedBack.routeName),
                      child:
                          SvgPicture.asset('assets/images/sad-alien.svg.png')),
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
                    height: 4,
                  ),
                  Text('(Predict for next 30 Second)',
                      style: TextStyle(fontSize: MyApp.fourTeen)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  Text(
                    '\$ 24,472.971',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
                  SizedBox(
                      height: (MediaQuery.of(context).size.height * .11) - 62),
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
                  Expanded(
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
                                Navigator.of(context)
                                    .pushNamed(PredictedUndo.routeName);
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
                                        'assets/images/red-arrow-down.svg'),
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
                                Navigator.of(context)
                                    .pushNamed(PredictedUndo.routeName);
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
                                      'assets/images/green-arrow-up.svg'),
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
                  SizedBox(
                    height: 6,
                  ),
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
