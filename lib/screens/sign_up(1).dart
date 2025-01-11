import 'package:clinkoin/data/datasource/auth_google_data_source.dart';
import 'package:clinkoin/main.dart';
import 'package:clinkoin/screens/create_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUp extends StatefulWidget {
  static final routeName = '/SignUp';
  @override
  _SignUpState createState() => _SignUpState();
}

AuthGoogleDataSource authGoogleDataSource = AuthGoogleDataSource();
Future signInTest(BuildContext context) async {
  try {
    await authGoogleDataSource.signIn();
    Navigator.of(context).pushNamedAndRemoveUntil(
      CreateProfile.routeName,
      ModalRoute.withName(CreateProfile.routeName),
    );
  } catch (error) {
    print(error);
  }
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            "Login/Register",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(245, 245, 253, 1),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 1,
            height: 355,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.circular(10),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 65,
                    ),
                    Text(
                      'Sign in / Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Secure your rewards.',
                      style: TextStyle(fontSize: MyApp.fourTeen),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Save you statistics.',
                      style: TextStyle(fontSize: MyApp.fourTeen),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Earn real bitcoin in your wallet.',
                      style: TextStyle(fontSize: MyApp.fourTeen),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Divider(
                        color: Color.fromRGBO(210, 210, 211, 1),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'We have google login yet',
                      style: TextStyle(fontSize: MyApp.fourTeen),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'We’ll add new methods soon',
                      style: TextStyle(fontSize: MyApp.fourTeen),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 185,
                      padding: EdgeInsets.all(6),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                          side: BorderSide(
                            color: Color.fromRGBO(197, 217, 250, 1),
                          ),
                        ),
                        color: Colors.white,
                        onPressed: () {
                          signInTest(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              'assets/images/google.svg',
                              width: 25,
                              height: 25,
                            ),
                            Text(
                              'Sign in with Google',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: MyApp.twelve,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                    top: -60,
                    child:
                        SvgPicture.asset('assets/images/alien-no-money.svg')),
              ],
              clipBehavior: Clip.none,
            ),
          ),
        ),
      ),
    );
  }
}
