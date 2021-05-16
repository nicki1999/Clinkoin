// import 'dart:async';
// import 'package:flutter/cupertino.dart';
// import 'package:phoenix_socket/phoenix_socket.dart';

// class BTCChannel with ChangeNotifier {
//   PhoenixSocket _socket;
//   PhoenixChannel _priceBtcChannel;
//   PhoenixChannel _userChannel;
//   PhoenixChannelEvent _momentaryPriceEvent =
//       PhoenixChannelEvent.custom('price:momentary');
//   PhoenixChannelEvent _hourlyPriceEvent =
//       PhoenixChannelEvent.custom('price:btc_one_hour');
//   PhoenixChannelEvent _getUserEvent = PhoenixChannelEvent.custom('phx_reply');
//   final String token;
//   final String userId;

//   StreamController _onEventMomentaryPrice = StreamController.broadcast();
//   StreamController _getUser = StreamController.broadcast();
//   StreamController<List> _onEventHourlyPrice = StreamController.broadcast();

//   Stream get onEventsMomentaryPrice => _onEventMomentaryPrice.stream;
//   Stream get onEventsHourlyPrice => _onEventHourlyPrice.stream;
//   Stream get onEventsGetUser => _getUser.stream;
//   var _price;
//   BTCChannel({this.token, this.userId});

//   String get price {
//     return _price.toString();
//   }

//   Future<void> socketConnection() async {
//     _socket = PhoenixSocket(
//       'ws://api.clinkoin.com/user_socket/websocket',
//       socketOptions: PhoenixSocketOptions(
//         params: {'token': token, 'vsn': '2.0.0'},
//       ),
//     );

//     await _socket.connect();
//     print(token);
//     print('socket is connected ? ${_socket.isConnected}');
//   }

//   Future priceChannel() async {
//     socketConnection();

//     _socket.openStream.listen((event) async {
//       _priceBtcChannel = _socket.addChannel(topic: 'price:BTC');
//       _priceBtcChannel.join();

//       await for (var messages in _priceBtcChannel.messages) {
//         final event = messages.event;
//         if (event == _momentaryPriceEvent) {
//           //every second
//           _onEventMomentaryPrice.add(messages.payload['price']);
//         }
//         if (event == _hourlyPriceEvent) {
//           // print(messages.payload['close_prices']);

//           _onEventHourlyPrice.add(messages.payload['close_prices']);
//         }
//       }
//     });
//   }

//   Future userChannel() async {
//     socketConnection();
//     _socket.openStream.listen((event) async {
//       _userChannel = _socket.addChannel(topic: 'user:$userId');
//       _userChannel.join();

//       await for (var messages in _userChannel.messages) {
//         final event = messages.event;
//         if (event == _getUserEvent) {
//           print(messages);
//           //gets user data
//           _getUser.add(messages.payload['phx_reply']);
//         }
//       }
//     });
//   }
// }
