import 'package:clinkoin/main.dart';
import 'package:clinkoin/models/feature.dart';
import 'package:clinkoin/screens/first_time_user_tutorial_predicted.dart';
import 'package:clinkoin/widgets/draw_graph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  final List<Feature> features = [
    Feature(
      color: Color.fromRGBO(41, 114, 255, 1),
      data: [0.2, 0.8, 0.4, 0.7, 0.6],
    ),
  ];
  @override
  Widget build(BuildContext context) {
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
            SizedBox(
              height: 4,
            ),
            Text('(Predict for next 30 Second)'),
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
            SizedBox(height: (MediaQuery.of(context).size.height * .15) - 62),
            FittedBox(
              child: LineGraph(
                features: features,
                size: Size(
                    400,
                    MediaQuery.of(context).size.height > 800
                        ? MediaQuery.of(context).size.height * .35
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
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            FittedBox(
              child: Container(
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
                      width: MediaQuery.of(context).size.width * .45,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                              FirstViewUserTutorialPredicted.routeName);
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
                              Image.asset('assets/images/red-arrow-down.png'),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Going Down',
                                style: TextStyle(
                                    color: Color.fromRGBO(249, 48, 128, 1),
                                    fontSize: 16),
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
                      width: MediaQuery.of(context).size.width * .45,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                              FirstViewUserTutorialPredicted.routeName);
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
                            Image.asset('assets/images/green-arrow-up.png'),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Going Up',
                              style: TextStyle(
                                  color: Color.fromRGBO(32, 174, 138, 1),
                                  fontSize: 16),
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
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
