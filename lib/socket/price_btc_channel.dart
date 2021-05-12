import 'dart:convert';

import 'package:clinkoin/models/btc_price_channel/momentary_event_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:phoenix_socket/phoenix_socket.dart';

class BTCChannel with ChangeNotifier {
  PhoenixSocket _socket;
  PhoenixChannel _priceBtcChannel;
  PhoenixChannelEvent _momentaryPrice =
      PhoenixChannelEvent.custom('price:momentary');
  final String token;
  var _price;
  BTCChannel({this.token});

  String get price {
    return _price.toString();
  }

  Future<void> socketConnection() async {
    _socket = PhoenixSocket(
      'ws://api.clinkoin.com/user_socket/websocket',
      socketOptions: PhoenixSocketOptions(
        params: {'token': token, 'vsn': '2.0.0'},
      ),
    );

    await _socket.connect();
    print(token);
    print('socket is connected ? ${_socket.isConnected}');
  }

  Future<MomentaryEventModel> momentaryPrice() async {
    await socketConnection();

    _socket.openStream.listen((event) async {
      _priceBtcChannel = _socket.addChannel(topic: 'price:BTC');
      _priceBtcChannel.join();

      await for (var messages in _priceBtcChannel.messages) {
        final event = messages.event;
        if (event == _momentaryPrice) {
          final modeled = MomentaryEventModel.fromJson(messages.payload);
          _price = modeled.price;
          // print(_price);

          notifyListeners();
        }
      }
    });
  }
}
