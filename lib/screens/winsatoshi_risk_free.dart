import 'package:clinkoin/screens/wallet.dart';
import 'package:clinkoin/widgets/shared_long_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WinsatoshiRiskFree extends StatelessWidget {
  static final routeName = '/WinsatoshiRiskFree';
  @override
  Widget build(BuildContext context) {
    void _changeScreen(BuildContext context) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        Wallet.routeName,
        ModalRoute.withName(Wallet.routeName),
      );
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 253, 1),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
              Container(
                height: MediaQuery.of(context).size.height * .72,
                width: (MediaQuery.of(context).size.width * 1) - 128,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.only(
                  top: 64,
                ),
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .07),
                      child: Image.asset('assets/images/bitcoin.png'),
                    ),
                    Text(
                      'Win Bitcoin',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                    ),
                    Text(
                      'Eearn Bitcoin with true predicts.You can earn more by play more.',
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
      ),
    );
  }
}
