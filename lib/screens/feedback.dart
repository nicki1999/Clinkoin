import 'package:clinkoin/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FeedBack extends StatelessWidget {
  static final routeName = '/FeedBack';

  @override
  Widget build(BuildContext context) {
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
            "Feedback",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        width: MediaQuery.of(context).size.width * 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 66,
            ),
            SvgPicture.asset('assets/images/Headphone.svg'),
            SizedBox(
              height: 35,
            ),
            Text(
              'Contact us',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Send us your feedback or ask your questions.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: MyApp.fourTeen),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      // margin: EdgeInsets.only(top: MediaQuery.of(context).size.width < 340 ? 10: 20),
                      height: 40,
                      child: RaisedButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: Color.fromRGBO(41, 114, 255, 1),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset('assets/images/email.svg'),
                            Text(
                              'Contact via Email',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .body1
                                    .fontFamily,
                                fontWeight: FontWeight.bold,
                                fontSize: MyApp.fourTeen,
                              ),
                            ),
                            Opacity(
                              opacity: 0,
                              child:
                                  SvgPicture.asset('assets/images/email.svg'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              // margin: EdgeInsets.only(top: MediaQuery.of(context).size.width < 340 ? 10: 20),
              height: 40,
              child: RaisedButton(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(
                    color: Color.fromRGBO(41, 114, 255, 1),
                    width: 2,
                  ),
                ),
                color: Colors.white,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/images/twitter.svg'),
                    Text(
                      'Contact via twitter',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(41, 114, 255, 1),
                          fontFamily:
                              Theme.of(context).textTheme.body1.fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: MyApp.fourTeen),
                    ),
                    Opacity(
                      opacity: 0,
                      child: SvgPicture.asset('assets/images/email.svg'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
