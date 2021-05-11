import 'dart:async';
import 'dart:convert';

import 'package:clinkoin/data/providers/auth_provider.dart';
import 'package:clinkoin/widgets/shared_long_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:provider/provider.dart';
import 'first_view_user_tutorial.dart';

class ForcastBitcoin extends StatefulWidget {
  static final routeName = '/forcast_bitcoin';

  @override
  _ForcastBitcoinState createState() => _ForcastBitcoinState();
}

class _ForcastBitcoinState extends State<ForcastBitcoin> {
  bool _swipe = false;
  bool _changeText = false;

  PhoenixSocket _socket;
  PhoenixChannel _priceBtcChannel;
  PhoenixChannel _userChannel;
  StreamController<Map> _onMessageController = StreamController<Map>();

  PhoenixChannelEvent _phxReply_event = PhoenixChannelEvent.custom('phx_reply');
  Stream<Message> message;
  @override
  void didChangeDependencies() async {
    final _token = Provider.of<AuthProvider>(context, listen: false).token;
    final _userId = Provider.of<AuthProvider>(context, listen: false).userId;
    //after getting token and userId RIGHT
    //connect socket
    _socket = PhoenixSocket(
      'ws://api.clinkoin.com/user_socket/websocket',
      socketOptions: PhoenixSocketOptions(
        params: {'token': _token, 'vsn': '2.0.0'},
      ),
    );
    await _socket.connect();
    print('socket is connected ? ${_socket.isConnected}');

    //when connection is open subscribe
    _socket.openStream.listen((event) async {
      //user and priceBTC join channel
      _userChannel = _socket.addChannel(topic: 'user:$_userId');
      _priceBtcChannel = _socket.addChannel(topic: 'price:BTC');
      _userChannel.join();
      _priceBtcChannel.join();

      // _userChannel.push('user:update', {
      //   "name": "nicki",
      //   "avatar": "nicki1",
      //   "location": "nicki2",
      //   "phone": "nicki3",
      //   "birthday": "nicki4",
      // });

      await for (var messages in _userChannel.messages) {
        var event = messages.event;
        //two events phx_reply and user:login:reward_report
        //search phx_reply
        if (event == _phxReply_event) {
          print('phx_reply : ${messages.payload}');
        }
      }

      // _userChannel.messages.listen((event) {
      // });
      //price:BTC channel
      // _channel = _socket.addChannel(topic: 'price:BTC');
      // _channel.join();
      // _channel.messages.listen((event) {
      //   _onMessageController.add(event.payload);
      //   print(event);
      // });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    void _changeScreen(BuildContext context) {
      if (_changeText) {
        Navigator.of(context).pushNamed(FirstViewUserTutorial.routeName);
      }
      setState(() {
        _swipe = true;
      });
    }

    final List<String> imgList = [
      'assets/images/alien.svg',
      'assets/images/bitcoin.png',
    ];
    Widget _forecastBitcoin = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: (MediaQuery.of(context).size.width * .81) - 16,
          //margin: EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          // margin: EdgeInsets.only(
          //   left: 40,
          // ),
          padding: EdgeInsets.symmetric(horizontal: 32),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .03),
                child: SvgPicture.asset(
                  'assets/images/chart.svg',
                ),
              ),
              Text(
                'Forcast Bitcoin',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
              Text(
                'Make Bitcoin forcasts and gain insight into crypto markets.',
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 32,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(41, 114, 255, 1),
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
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(196, 196, 196, 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Container(
        //   width: 30,
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.only(
        //       topLeft: Radius.circular(10),
        //       bottomLeft: Radius.circular(10),
        //     ),
        //   ),
        // ),
      ],
    );
    Widget _winsatoshiRiskFree = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Container(
        //   margin: EdgeInsets.only(),
        //   width: 30,
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.only(
        //       topRight: Radius.circular(10),
        //       bottomRight: Radius.circular(10),
        //     ),
        //   ),
        // ),
        Container(
          margin: EdgeInsets.only(
            left: 8,
          ),
          width: (MediaQuery.of(context).size.width * .81) - 20,
          //margin: EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .03),
                child: SvgPicture.asset('assets/images/bitcoin.svg'),
              ),
              Text(
                'Win Bitcoin',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
              Text(
                'Earn Bitcoin with true predicts.You can earn more by play more.',
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
                    width: 32,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(41, 114, 255, 1),
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
                ],
              ),
            ],
          ),
        ),
        // Container(
        //   margin: EdgeInsets.only(),
        //   width: 30,
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.only(
        //       topLeft: Radius.circular(10),
        //       bottomLeft: Radius.circular(10),
        //     ),
        //   ),
        // ),
      ],
    );
    Widget _wallet = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Container(
        //   margin: EdgeInsets.only(),
        //   width: 30,
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.only(
        //       topRight: Radius.circular(10),
        //       bottomRight: Radius.circular(10),
        //     ),
        //   ),
        // ),
        Container(
          width: (MediaQuery.of(context).size.width * .8) - 12,
          margin: EdgeInsets.only(left: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          //margin: EdgeInsets.only(right: 30),
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .03),
                child: SvgPicture.asset('assets/images/wallet.svg'),
              ),
              Text(
                'Wallet',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
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
    );
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 253, 1),
      body: SafeArea(
        child: Builder(
          builder: (context) {
            final double height = MediaQuery.of(context).size.height;
            return Column(
              children: [
                Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height < 580 ? 40 : 64,
                    ),
                    height: MediaQuery.of(context).size.height < 580
                        ? (MediaQuery.of(context).size.height * 1) - 126
                        : (MediaQuery.of(context).size.height * 1) - 146,
                    child: new Swiper(
                      onIndexChanged: (value) {
                        setState(() {
                          value == 2 ? _changeText = true : _changeText = false;

                          _swipe = false;
                        });
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return index == 0
                            ? _forecastBitcoin
                            : index == 1
                                ? _winsatoshiRiskFree
                                : index == 2
                                    ? _wallet
                                    : null;
                      },
                      itemCount: 3,
                      viewportFraction: .8,
                      scale: 1,
                      loop: false,
                      control: new SwiperControl(
                        //lastSlide: _changeText,
                        goesNext: _swipe,
                        iconNext: null,
                        iconPrevious: null,
                      ),
                      duration: 500,
                    )
                    // Swiper(
                    //   onIndexChanged: (value) {
                    //     setState(() {
                    //       value == 2 ? _changeText = true : _changeText = false;

                    //       _swipe = false;
                    //     });
                    //   },
                    //   itemBuilder: (BuildContext context, int index) {
                    //     // print(_swipe);

                    //     return index == 0
                    //         ? _forecastBitcoin
                    //         : index == 1
                    //             ? _winsatoshiRiskFree
                    //             : index == 2
                    //                 ? _wallet
                    //                 : null;
                    //   },
                    //   loop: false,
                    //   itemCount: 3,
                    //   control: new SwiperControl(
                    //     //lastSlide: _changeText,
                    //     goesNext: _swipe,
                    //     iconNext: null,
                    //     iconPrevious: null,
                    //   ),
                    //   duration: 500,
                    //   scale: 0.7,
                    //   viewportFraction: 0.8,
                    // ),
                    ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SharedLongButton(
                      button: _changeScreen,
                      buttonText:
                          _changeText ? 'Lets try your first Predict' : 'Next',
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
              ],
            );
          },
        ),
      ),
      //     StreamBuilder(
      //   stream: message,
      //   builder: (context, snapshot) {
      //     return snapshot.hasData
      //         ? Center(
      //             child: Text(
      //               '$snapshot',
      //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
      //             ),
      //           )
      //         : Center(child: Text('no data'));
      //   },
      // ),
    );
  }
}
