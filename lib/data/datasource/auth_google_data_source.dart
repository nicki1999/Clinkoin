import 'package:flutter_appauth/flutter_appauth.dart';

class AuthGoogleDataSource {
  Future signIn() async {
    FlutterAppAuth appAuth = FlutterAppAuth();
    final AuthorizationTokenResponse result =
        await appAuth.authorizeAndExchangeCode(
      AuthorizationTokenRequest(
        '433597584473-rn4no5qt0qke33rjcsjl3a2eft9t0jbk.apps.googleusercontent.com',
        'com.clinkoin:/oauth2redirect',
        // 'http://api.clinkoin.com/auth/google/callback',
        issuer: 'https://accounts.google.com',
        scopes: ['email', 'profile'],
      ),
    );
    return result;
  }
}
