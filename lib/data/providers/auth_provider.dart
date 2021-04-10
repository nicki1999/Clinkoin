import 'dart:async';
import 'dart:convert';
import '../apis/api.dart' as openApi;
import 'package:clinkoin/data/apis/api.dart';

import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  Timer _authTimer;

  bool get isAuth {
    return _token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  String get userId {
    return _userId;
  }

  Future<void> getToken(String deviceId) async {
    var api_instance = AuthApi();
    try {
      var response =
          await api_instance.apiV1AuthIdentificationDeviceGet(deviceId);
      // var responseData = json.decode(response);

      // print(response);
      notifyListeners();
    } on ApiException catch (e) {
      print("Exception when calling AuthApi->post: $e\n");
      throw e;
    } catch (e) {
      print("Exception when calling AuthApi->post: $e\n");
      throw e;
    }
  }
}
