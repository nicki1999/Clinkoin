import 'package:carousel_slider/carousel_slider.dart';
import 'package:clinkoin/main.dart';
import 'package:clinkoin/screens/winsatoshi_risk_free.dart';
import 'package:clinkoin/widgets/shared_long_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForcastBitcoin extends StatefulWidget {
  static final routeName = '/forcast_bitcoin';

  @override
  _ForcastBitcoinState createState() => _ForcastBitcoinState();
}

class _ForcastBitcoinState extends State<ForcastBitcoin> {
  @override
  Widget build(BuildContext context) {
    void _changeScreen(BuildContext context) {
      Navigator.of(context).push(MyApp.createRoute(WinsatoshiRiskFree()));
    }

    final List<String> imgList = [
      'assets/images/alien.png',
      'assets/images/bitcoin.png',
    ];
    Widget _myAnimatedWidget = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .72,
          width: (MediaQuery.of(context).size.width * 1) - 104,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.only(
            top: 64,
            left: 40,
          ),
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .07),
                child: Image.asset('assets/images/chart.png'),
              ),
              Text(
                'Forcast Bitcoin',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
              Text(
                'Make Bitcoin forcasts and gain insight into crypto markets.',
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 32,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(41, 114, 255, 1),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 64,
          ),
          height: MediaQuery.of(context).size.height * .72,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 253, 1),
      body: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx < 0) {
            Navigator.of(context).push(MyApp.createRoute(WinsatoshiRiskFree()));
          }
        },
        child: SafeArea(
          child: Builder(
            builder: (context) {
              final double height = MediaQuery.of(context).size.height;
              return Column(
                children: [
                  AnimatedSwitcher(
                    duration: Duration(seconds: 5),
                    child: _myAnimatedWidget,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SharedLongButton(
                        button: _changeScreen,
                        buttonText: 'Next',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
