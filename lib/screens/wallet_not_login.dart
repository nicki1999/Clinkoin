import 'package:clinkoin/screens/sign_up.dart';
import 'package:clinkoin/widgets/shared_long_button.dart';
import 'package:flutter/material.dart';

class WalletNotLogin extends StatelessWidget {
  static final routeName = './WalletNotLogin';

  @override
  Widget build(BuildContext context) {
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
                          child: Image.asset('assets/images/dialog-close.png')),
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
                        Text('Need '),
                        Text(
                          '20,000',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(' more satoshi, keep going.'),
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
                              fontFamily:
                                  Theme.of(context).textTheme.body1.fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
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
              height: 400,
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
                          child: Image.asset('assets/images/dialog-close.png')),
                    ),
                    Image.asset('assets/images/alien-no-money.png'),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Let’s setup your acccount to continue!',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Text('You’ll secure your rewards and earn real '),
                    Text('money towards your first investment.'),
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
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
                      child: Image.asset(
                        'assets/images/login-bitcoin.png',
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
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '(SATOSHI)  =  ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Text(
                  '1 ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  ' (BITCOIN)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Unlock withdraw by collect atleast 20,000 satoshi',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SharedLongButton(
                    button: _showModal,
                    buttonText: 'Withdraw',
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
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        'for saving your rewards!',
                        style: TextStyle(fontWeight: FontWeight.bold),
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
