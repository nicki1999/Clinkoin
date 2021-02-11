import 'package:clinkoin/screens/forcast_bitcoin.dart';
import 'package:clinkoin/screens/wallet.dart';
import 'package:clinkoin/screens/winsatoshi_risk_free.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      home: ForcastBitcoin(),
      routes: {
        ForcastBitcoin.routeName: (ctx) => ForcastBitcoin(),
        WinsatoshiRiskFree.routeName: (ctx) => WinsatoshiRiskFree(),
        Wallet.routeName: (ctx) => Wallet(),
      },
    );
  }
}
