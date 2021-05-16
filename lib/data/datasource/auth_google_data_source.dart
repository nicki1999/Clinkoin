import 'package:flutter_appauth/flutter_appauth.dart';

class AuthGoogleDataSource {
  Future signIn() async {
    FlutterAppAuth appAuth = FlutterAppAuth();
    final AuthorizationTokenResponse result =
        await appAuth.authorizeAndExchangeCode(
      AuthorizationTokenRequest(
        '433597584473-03gvf6ugu24b1ptd1k9oo390nssns6qb.apps.googleusercontent.com',
        'com.clinkoin:/oauth2redirect',
        issuer: 'https://accounts.google.com',
        scopes: ['email', 'profile'],
      ),
    );
    print('access token is :${result.accessToken}');
    print('refresh token is :${result.refreshToken}');
    return result;

    // print('first ${result.authorizationAdditionalParameters}');
    // {authuser: 1, prompt: consent}

    //print('second ${result.accessToken}');
    //ya29.a0AfH6SMBmou-wy7iJ1iA4gRLw2uVk7kxKdIyolvp8xJWOM9COYUok4sV4VqqkD3Be00UwKvwRu1-YJFHjA04r9RPL8JyEwbF84Tu1OtoEuJSwiVl7BzNjTo_nMvFrHFeVp0LAvJ0oZP2iosrPQk6_hpta2od6

    // print('third ${result.accessTokenExpirationDateTime}');
    // 2021-04-17 12:59:51.277 1saatas

    //print('fourth ${result.idToken}');
    //eyJhbGciOiJSUzI1NiIsImtpZCI6Ijc3NDU3MzIxOGM2ZjZhMmZlNTBlMjlhY2JjNjg2NDMyODYzZmM5YzMiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI0MzM1OTc1ODQ0NzMtMDNndmY2dWd1MjRiMXB0ZDFrOW9vMzkwbnNzbnM2cWIuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI0MzM1OTc1ODQ0NzMtMDNndmY2dWd1MjRiMXB0ZDFrOW9vMzkwbnNzbnM2cWIuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMDI4NTE3MjcxMDMzNzM4NTIyNjQiLCJlbWFpbCI6Im5pY2tpbmFqYWZpMTk5OUBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiYXRfaGFzaCI6IkIzSlpZeUtXd1VkS3c4RHdRN0JxSmciLCJuYW1lIjoibmlraSBuYWphZmkiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDUuZ29vZ2xldXNlcmNvbnRlbnQuY29tLy11LWJRWklnOXVrRS9BQUFBQUFBQUFBSS9BQUFBQUFBQUFBQS9BTVp1dWNrQk82UUV3dVpqa3VHZllJMHJsMm9Ob3BFUlZ3L3M5Ni1jL3Bob3RvLmpwZyIsImdpdmVuX25hbWUiOiJuaWtpIiwiZmFtaWx5X25hbWUiOiJuYWphZmkiLCJsb2NhbGUiOiJlbiIsImlhdCI6MTYxODY0NDU5MiwiZXhwIjoxNjE4NjQ4MTkyfQ.iCr9Lg5PV5fIVa4lJGA8CaflUxkrFzkzWPRFl2oRKbn_iVyN2y2bJoOqmIWKis5xpcAuzXNgMka3aneETnXji85it6L2UbGNr9m-nTrJXzyBQKklNunIgGx--OqJhKtPVykvb3M9n2KMi6sHwIOMGZl5PS

    //print('fifth ${result.refreshToken}');
    //1//09qppB-8FyYeuCgYIARAAGAkSNwF-L9Ir_oifqxUMjVicoNFX7iLZvvo6oJ35fpvMyXwsC4ThNubD6D5zDg1jy9mo31Mhhe0hoAo

    //print('sixth ${result.tokenAdditionalParameters}');
    //{}
    //
    // print('seventh ${result.tokenType}');
    // Bearer

    //result.refreshTokenSome providers may return a refresh token that could be used to refresh short-lived access tokens. A request to get a new access token before it expires could be made that would like similar to the following code
  }
}
