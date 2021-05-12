import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import '../apis/api.dart' as openApi;
import 'package:clinkoin/data/apis/api.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  Timer _authTimer;
  bool _firstTime;
  String _deviceId;
  String _deviceToken;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  bool get isAuth {
    return _token != null;
  }

  bool get isFirstTime {
    return _firstTime;
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

  Future<void> firstTime() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('firstTime', false);
    _firstTime = prefs.getBool('firstTime');
    notifyListeners();
  }

  Future<void> _logout() async {
    _token = _expiryDate = _userId = null;
    if (_authTimer != null) {
      _authTimer.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
  }

  Future<void> _autoLogout() async {
    if (_authTimer != null) {
      _authTimer.cancel();
    }
    final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), _logout);
  }

  Future<void> signUpp(String deviceId, String deviceToken) async {
    var api_instance = openApi.AuthenticationApi();

    print('deviceId $deviceId');
    print('deviceToken $deviceToken');
    var credentials =
        openApi.DeviceDevice(deviceId: deviceId, deviceToken: deviceToken);
    var device = openApi.Device(device: credentials);
    try {
      var response =
          await api_instance.authIdentificationDeviceNewPost(device: device);
      var responseData = json.decode(response);
      // responseData is {id: 23996831, jwt: eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhY2NvdW50cyIsImV4cCI6MTYyMDM4ODg2MiwiaWF0IjoxNjE5Nzg0MDYyLCJpc3MiOiJhY2NvdW50cyIsImp0aSI6ImU3YmExZmFjLWQ1ZGEtNGUwNy04Yzc0LTg2ZTk3MWM4MGVmNCIsIm5iZiI6MTYxOTc4NDA2MSwicm9sZXMiOlsxMF0sInN1YiI6IjIzOTk2ODMxIiwidHlwIjoiYWNjZXNzIn0.1UEqH1poTfoX24SNSaikV8pWWsz5GNfMzheVfG196kMYstrvkxJCF86DAnSaZ8bJ1Qpvsa10lsgsPwnADzMX1A}

      _token = responseData['jwt'];
      _userId = responseData['id'];
      Map<String, dynamic> payload = Jwt.parseJwt(responseData['jwt']);
      //exp az moqeE ke tooie DB sabt mishe hesab mishe...
      var formatted =
          DateTime.fromMillisecondsSinceEpoch(payload['exp'] * 1000);
      //subtract gotten date to dateTime.now() => 604800 which is 1 week
      int difference = formatted.difference(DateTime.now()).inSeconds;
      _expiryDate = DateTime.now().add(Duration(seconds: difference));

      _autoLogout();
      //notifyListeners();
      print('1.token is $_token and id is $_userId');
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'token': _token,
        'expiryDate': _expiryDate.toIso8601String(),
        'userId': _userId,
      });
      final credentials =
          json.encode({'deviceToken': deviceToken, 'deviceId': deviceId});

      prefs.setString('userData', userData);
      prefs.setString('credentials', credentials);
    } on ApiException catch (e) {
      print("Exception when calling AuthApi->post: $e\n");
      throw e;
    } catch (e) {
      print("Exception when calling AuthApi->post: $e\n");
      throw e;
    }
  }

  Future<void> signIn() async {
    final prefs = await SharedPreferences.getInstance();
    final extractedData =
        json.decode(prefs.getString('credentials')) as Map<String, Object>;

    _deviceToken = extractedData['deviceToken'];
    _deviceId = extractedData['deviceId'];

    var api_instance = openApi.AuthenticationApi();

    final credentials = openApi.DeviceDevice(
      deviceId: _deviceId,
      deviceToken: _deviceToken,
    );
    var device = openApi.Device(device: credentials);
    try {
      var response =
          await api_instance.authIdentificationDevicePost(device: device);
      var responseData = json.decode(response);

      _token = responseData['jwt'];
      _userId = responseData['id'];
      Map<String, dynamic> payload = Jwt.parseJwt(responseData['jwt']);
      var formatted =
          DateTime.fromMillisecondsSinceEpoch(payload['exp'] * 1000);
      //subtract gotten date to dateTime.now() => 604800 which is 1 week
      int difference = formatted.difference(DateTime.now()).inSeconds;
      _expiryDate = DateTime.now().add(Duration(seconds: difference));

      _autoLogout();
      //  notifyListeners();
      print('2.token is $_token and id is $_userId');
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'token': _token,
        'expiryDate': _expiryDate.toIso8601String(),
        'userId': _userId
      });
      prefs.setString('userData', userData);
    } on ApiException catch (e) {
      print("Exception when calling AuthApi->post: $e\n");
      throw e;
    } catch (e) {
      print("Exception when calling AuthApi->post: $e\n");
      throw e;
    }
  }

  void setCredentials() {
    _deviceToken = randomString(15);
    _deviceId = Uuid().v1();
  }

  Future tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();

    //for the first time there is no userData or credentials in sharedpref
    if (!prefs.containsKey('userData') && !prefs.containsKey('credentials')) {
      print('signUp');
      setCredentials();
      await signUpp(_deviceId, _deviceToken);
    }
    //wanna sign in
    else if (!prefs.containsKey('userData') &&
        prefs.containsKey('credentials')) {
      print('signin');
      //jwt : eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhY2NvdW50cyIsImV4cCI6MTYyMDY2Mzc4MSwiaWF0IjoxNjIwMDU4OTgxLCJpc3MiOiJhY2NvdW50cyIsImp0aSI6IjIxNjRlOTFkLWZjZGYtNDdlMC05NjM1LTliOGQ4YmQxNzM0YSIsIm5iZiI6MTYyMDA1ODk4MCwicm9sZXMiOlsxMF0sInN1YiI6IjI1NDg3NTkzIiwidHlwIjoiYWNjZXNzIn0.xtLryIyiFhAydzw4lC6UAHNftEmc-vlTMT1CKbE4DiXJKs9gxacHqIl0HZNMLO8yhiQ6Fwi461pz5dBzHWdvCQ
      await signIn();
    } else if (prefs.containsKey('userData') &&
        prefs.containsKey('credentials')) {
      print('set userData');
      final extractedData =
          json.decode(prefs.getString('userData')) as Map<String, Object>;

      _token = extractedData['token'];
      _expiryDate = DateTime.parse(extractedData['expiryDate']);
      _userId = extractedData['userId'];
      //print('my token $_token');
      print('3.token is $_token and id is $_userId');
      _autoLogout();
      //  notifyListeners();
    }
  }
}
