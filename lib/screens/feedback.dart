import 'package:flutter/material.dart';

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
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 66,
            ),
            Image.asset('assets/images/Headphone.png'),
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
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      // margin: EdgeInsets.only(top: MediaQuery.of(context).size.width < 340 ? 10: 20),
                      height: 40,
                      child: RaisedButton(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: Color.fromRGBO(41, 114, 255, 1),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/images/email.png'),
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
                                fontSize: 17,
                              ),
                            ),
                            Opacity(
                              opacity: 0,
                              child: Image.asset('assets/images/email.png'),
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
              margin: EdgeInsets.symmetric(horizontal: 16),
              // margin: EdgeInsets.only(top: MediaQuery.of(context).size.width < 340 ? 10: 20),
              height: 40,
              child: RaisedButton(
                elevation: 1,
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
                    Image.asset('assets/images/twitter.png'),
                    Text(
                      'Contact via twitter',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(41, 114, 255, 1),
                        fontFamily:
                            Theme.of(context).textTheme.body1.fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Opacity(
                      opacity: 0,
                      child: Image.asset('assets/images/email.png'),
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
