import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugasakhir/component/toast.dart';
import 'package:tugasakhir/routes/app_routes.dart';
import 'package:tugasakhir/services/baseurl.dart';

class AuthServices {
  Client client = Client();

  Future<bool> login(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uri = Uri.parse(BaseUrl().getip() + '/login');
    final response = await client.post(uri, headers: {
      "Accept": "application/json",
    }, body: {
      "email": email,
      "password": password
    });
    var res = jsonDecode(response.body);
    print(res);
    if (response.statusCode == 200) {
      var token = res['data']['token'];
      var name = res['data']['name'];
      var id = res['data']['id'].toString();
      prefs.setString('token', token);
      var role = res['data']['role'];
      prefs.setString('name', name);
      prefs.setString('id', id);
      if (role == 'Kepala Lapang') {
        Get.toNamed(Routename.dashboardKepala);
      } else {
        Get.toNamed(Routename.dasboard);
      }
      return true;
    } else {
      if (res['message'] != null) {
        ToastCustom.toastError(res['message']);
      } else {
        List error = [];
        //res foreach key and value
        res['errors'].forEach((key, value) {
          for (var key in value) {
            error.add(key);
          }
        });
        ToastCustom.toastError(error.first);
        return false;
      }
      return false;
    }
  }
}
