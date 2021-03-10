import 'package:clinkoin/main.dart';
import 'package:clinkoin/screens/first_view_user_tutorial.dart';
import 'package:clinkoin/widgets/shared_long_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  static final routeName = '/Wallet';
  @override
  Widget build(BuildContext context) {
    void _changeScreen(BuildContext context) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        FirstViewUserTutorial.routeName,
        ModalRoute.withName(FirstViewUserTutorial.routeName),
      );
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 253, 1),
      body: SafeArea(
        child: GestureDetector(
          onPanUpdate: (details) {
            if (details.delta.dx < 0) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                FirstViewUserTutorial.routeName,
                ModalRoute.withName(FirstViewUserTutorial.routeName),
              );
            }
            if (details.delta.dx > 0) {
              Navigator.of(context).pop();
            }
          },
          child: Column(
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
                    width: (MediaQuery.of(context).size.width * 1) - 104,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.only(top: 64, right: 40),
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * .07),
                          child: Image.asset('assets/images/wallet.png'),
                        ),
                        Text(
                          'Wallet',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 21),
                        ),
                        Text(
                          'You can get your Rewards in a real bitcoin wallet.',
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SharedLongButton(
                    button: _changeScreen,
                    buttonText: 'Lets try your first Predict',
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
