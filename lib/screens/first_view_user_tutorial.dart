import 'package:clinkoin/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstViewUserTutorial extends StatefulWidget {
  static final routeName = '/FirstViewUserTutorial';

  @override
  _FirstViewUserTutorialState createState() => _FirstViewUserTutorialState();
}

class _FirstViewUserTutorialState extends State<FirstViewUserTutorial> {
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
              height: 34,
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
              height: 16,
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
            Container(
              height: MediaQuery.of(context).size.height * .35,
              width: MediaQuery.of(context).size.width * 1,
              color: Colors.blue,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  '1H',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromRGBO(41, 114, 255, 1),
                  primary: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
