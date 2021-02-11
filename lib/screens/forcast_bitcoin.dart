import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForcastBitcoin extends StatelessWidget {
  static final routeName = '/forcast_bitcoin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 253, 1),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .72,
            width: (MediaQuery.of(context).size.width * 1) - 104,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(top: 64, left: 40, bottom: 64),
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .07),
                  child: FittedBox(
                    child: Image.asset('assets/images/chart.png'),
                  ),
                ),
                Text(
                  'Forcast Bitcoin',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
                Text(
                  'Make Bitcoin forcasts and gain insights into crypto markets.',
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .72,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
