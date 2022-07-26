import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class TokenC {
  static String token = '';

  Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('token') == null) {
      token = '';
    } else {
      token = sharedPreferences.getString('token')!;
    }
    return token;
  }

  Future<Map<String, String>> header() async {
    String tok = await TokenC().getToken();
    print(tok);
    var header = {
      'Accept': "application/json",
      'Authorization': "Bearer $tok",
    };
    return header;
  }
}
