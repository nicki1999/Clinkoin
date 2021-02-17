import 'package:clinkoin/screens/first_time_home_page_wait_for_overlay.dart';
import 'package:clinkoin/screens/first_time_user_tutorial_predicted.dart';
import 'package:clinkoin/screens/first_view_user_tutorial.dart';
import 'package:clinkoin/screens/forcast_bitcoin.dart';
import 'package:clinkoin/screens/wallet.dart';
import 'package:clinkoin/screens/winsatoshi_risk_free.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
      home: FirstTimeHomePageWaitForOverlay(),
      routes: {
        ForcastBitcoin.routeName: (ctx) => ForcastBitcoin(),
        WinsatoshiRiskFree.routeName: (ctx) => WinsatoshiRiskFree(),
        Wallet.routeName: (ctx) => Wallet(),
        FirstTimeHomePageWaitForOverlay.routeName: (ctx) =>
            FirstTimeHomePageWaitForOverlay(),
        FirstViewUserTutorial.routeName: (ctx) => FirstViewUserTutorial(),
        FirstViewUserTutorialPredicted.routeName: (ctx) =>
            FirstViewUserTutorialPredicted(),
      },
    );
  }
}
