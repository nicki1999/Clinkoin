import 'package:clinkoin/screens/sign_up.dart';
import 'package:clinkoin/widgets/shared_long_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../main.dart';

class WalletNotLogin extends StatelessWidget {
  static final routeName = './WalletNotLogin';

  @override
  Widget build(BuildContext context) {
    Future _confirmPayment(BuildContext context) {
      return showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              height: 383,
              color: Color(0xFF737373),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(25.0),
                    topRight: const Radius.circular(25.0),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    right: 24,
                    left: 24,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Confirm Payment',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: SvgPicture.asset(
                                  'assets/images/dialog-close.svg'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Text(
                            '25,000 ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: MyApp.twentyOne),
                          ),
                          Text('(Satoshi)'),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text('4.65\$ - ',
                              style: TextStyle(
                                  color: Color.fromRGBO(142, 155, 166, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: MyApp.fourTeen)),
                          Text(
                            '0.1\$ ',
                            style: TextStyle(
                                color: Color.fromRGBO(211, 89, 154, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: MyApp.fourTeen),
                          ),
                          Text(
                            '= 4.64\$',
                            style: TextStyle(
                                color: Color.fromRGBO(142, 155, 166, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: MyApp.fourTeen),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'This may take up to 24 hourse. Fees of this transfer will be deducted.',
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        onTap: () => null,
                        decoration: InputDecoration(
                          hintText: 'BTC Wallet',
                          hintStyle: TextStyle(fontSize: MyApp.twelve),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                5.0,
                              ),
                            ),
                            borderSide: new BorderSide(
                              color: Colors.grey,
                              width: 2.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                5.0,
                              ),
                            ),
                            borderSide: new BorderSide(
                              color: Colors.grey,
                              width: 2.5,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Careful! Enter your ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 11),
                          ),
                          Text(
                            'BTC Wallet Address',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(63, 128, 255, 1),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                          child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .42,
                              // margin: EdgeInsets.only(top: MediaQuery.of(context).size.width < 340 ? 10: 20),
                              height: 40,
                              child: RaisedButton(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                color: Color.fromRGBO(223, 230, 255, 1),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Close',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromRGBO(41, 114, 255, 1),
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .body1
                                        .fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: MyApp.fourTeen,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .42,
                              // margin: EdgeInsets.only(top: MediaQuery.of(context).size.width < 340 ? 10: 20),
                              height: 40,
                              child: RaisedButton(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                color: Color.fromRGBO(41, 114, 255, 1),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Withdraw',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: Theme.of(context)
                                          .textTheme
                                          .body1
                                          .fontFamily,
                                      fontWeight: FontWeight.bold,
                                      fontSize: MyApp.fourTeen),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                      SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    Future _showModal(BuildContext context) {
      return showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              height: 200,
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
                          child: SvgPicture.asset(
                              'assets/images/dialog-close.svg')),
                    ),
                    Text(
                      'Can’t whithdraw now',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Need ',
                            style: TextStyle(fontSize: MyApp.fourTeen)),
                        Text(
                          '20,000',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: MyApp.fourTeen),
                        ),
                        Text(
                          ' more satoshi, keep going.',
                          style: TextStyle(fontSize: MyApp.fourTeen),
                        ),
                      ],
                    ),
                    Expanded(
                        child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1,
                        margin: EdgeInsets.symmetric(horizontal: 32),
                        // margin: EdgeInsets.only(top: MediaQuery.of(context).size.width < 340 ? 10: 20),
                        height: 40,
                        child: RaisedButton(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          color: Color.fromRGBO(223, 230, 255, 1),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Close',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(41, 114, 255, 1),
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .body1
                                    .fontFamily,
                                fontWeight: FontWeight.bold,
                                fontSize: MyApp.fourTeen),
                          ),
                        ),
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

    void _changeScreen3(BuildContext context) {
      Navigator.of(context).pushNamed(SignUp.routeName);
    }

    Future _showModalSignUp(BuildContext context) {
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
                          child: SvgPicture.asset(
                              'assets/images/dialog-close.svg')),
                    ),
                    SvgPicture.asset('assets/images/alien-no-money.svg'),
                    SizedBox(
                      height: 28,
                    ),
                    Text(
                      'Let’s setup your acccount to continue!',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      'You’ll secure your rewards and earn real ',
                      style: TextStyle(
                        fontSize: MyApp.fourTeen,
                      ),
                    ),
                    Text(
                      'money towards your first investment.',
                      style: TextStyle(
                        fontSize: MyApp.fourTeen,
                      ),
                    ),
                    Expanded(
                        child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SharedLongButton(
                        button: _changeScreen3,
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

    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 253, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(51),
        child: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          )),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Withdraw",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 95,
            ),
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Text(
                          'Your Wallet',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '220',
                              style: TextStyle(
                                color: Color.fromRGBO(41, 162, 135, 1),
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '(SATOSHI)',
                              style: TextStyle(
                                  color: Color.fromRGBO(81, 81, 81, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      top: -85,
                      child: SvgPicture.asset(
                        'assets/images/login-bitcoin.svg',
                      ),
                    ),
                  ],
                  clipBehavior: Clip.none),
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '100,000,000 ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MyApp.fourTeen,
                  ),
                ),
                Text(
                  '(SATOSHI)  =  ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                ),
                Text(
                  '1 ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MyApp.fourTeen,
                  ),
                ),
                Text(
                  ' (BITCOIN)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Unlock withdraw by collect atleast 20,000 satoshi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MyApp.fourTeen,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // SharedLongButton(
                  //   button: _confirmPayment,
                  //   buttonText: 'Withdraw',
                  // ),
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    // margin: EdgeInsets.only(top: MediaQuery.of(context).size.width < 340 ? 10: 20),
                    height: 40,
                    child: RaisedButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: Color.fromRGBO(41, 114, 255, 1),
                      onPressed: () {
                        _confirmPayment(context);
                      },
                      child: Text(
                        'Withdraw',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily:
                              Theme.of(context).textTheme.body1.fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: MyApp.fourTeen,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => _showModalSignUp(context),
                        child: Text(
                          'Login ',
                          style: TextStyle(
                              color: Color.fromRGBO(41, 114, 255, 1),
                              decoration: TextDecoration.underline,
                              fontSize: MyApp.fourTeen,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        'for saving your rewards!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MyApp.fourTeen,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
