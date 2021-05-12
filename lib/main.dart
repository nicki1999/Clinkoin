import 'dart:io';

import 'package:clinkoin/data/providers/auth_provider.dart';
import 'package:clinkoin/screens/create_profile.dart';
import 'package:clinkoin/screens/feedback.dart';
import 'package:clinkoin/screens/first_time_home_page_wait_for_overlay.dart';
import 'package:clinkoin/screens/first_time_user_tutorial_predicted.dart';
import 'package:clinkoin/screens/first_view_user_tutorial.dart';
import 'package:clinkoin/screens/forcast_bitcoin.dart';
import 'package:clinkoin/screens/home_page.dart';
import 'package:clinkoin/screens/predicted_undo.dart';
import 'package:clinkoin/screens/sign_up.dart';
import 'package:clinkoin/screens/wallet_not_login.dart';
import 'package:clinkoin/socket/price_btc_channel.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  //sliding animation

  static Route createRoute(final navigateTo) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) => navigateTo,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static final twentyOne = 21.0;
  static final eighteen = 18.0;
  static final fourTeen = 14.0;
  static final twelve = 12.0;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AuthProvider(),
        ),
        ChangeNotifierProxyProvider<AuthProvider, BTCChannel>(
            create: (context) => null,
            update: (context, auth, btc) {
              return BTCChannel(token: auth.token);
            }),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, auth, _) {
          return MaterialApp(
            theme: ThemeData(
              fontFamily: 'IRANSans',
              textTheme: ThemeData.light().textTheme.copyWith(
                    body1: TextStyle(
                      fontFamily: 'IRANSans',
                      fontSize: 16,
                    ),
                  ),
            ),
            home: FutureBuilder(
              future: auth.tryAutoLogin(),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? Scaffold(
                        body: Center(
                          child: Text('is loading...'),
                        ),
                      )
                    : FirstViewUserTutorial();
              },
            ),
            routes: {
              ForcastBitcoin.routeName: (ctx) => ForcastBitcoin(),
              FeedBack.routeName: (ctx) => FeedBack(),
              PredictedUndo.routeName: (ctx) => PredictedUndo(),
              HomePage.routeName: (ctx) => HomePage(),
              CreateProfile.routeName: (ctx) => CreateProfile(),
              SignUp.routeName: (ctx) => SignUp(),
              FirstTimeHomePageWaitForOverlay.routeName: (ctx) =>
                  FirstTimeHomePageWaitForOverlay(),
              FirstViewUserTutorial.routeName: (ctx) => FirstViewUserTutorial(),
              WalletNotLogin.routeName: (ctx) => WalletNotLogin(),
              FirstViewUserTutorialPredicted.routeName: (ctx) =>
                  FirstViewUserTutorialPredicted(),
            },
          );
        },
      ),
    );
  }
}
