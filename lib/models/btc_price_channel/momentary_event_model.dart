import 'package:flutter/foundation.dart';

class MomentaryEventModel {
  var price;
  int second;
  MomentaryEventModel({@required this.price, @required this.second});

  factory MomentaryEventModel.fromJson(Map<String, dynamic> json) {
    return MomentaryEventModel(price: json['price'], second: json['second']);
  }
}
