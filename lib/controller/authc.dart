import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugasakhir/component/toast.dart';
import 'package:tugasakhir/routes/app_routes.dart';
import 'package:tugasakhir/services/authservices.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var valueLogin = false.obs;
  void handleLogin() async {
    EasyLoading.show(status: 'Loading...');
    try {
      await AuthServices()
          .login(emailController.text, passwordController.text)
          .then((value) {
        if (value == true) {
          EasyLoading.dismiss();
          handleRemeberme();
        } else {
          EasyLoading.dismiss();
        }
      });
      EasyLoading.removeAllCallbacks();
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.removeAllCallbacks();
      ToastCustom.toastError(e.toString());
    }
  }

  void handleRemeberme() async {
    if (valueLogin.value == true) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("ingatLogin", true);
      prefs.setString('email_me', emailController.text);
      prefs.setString('password_me', passwordController.text);
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("ingatLogin", false);
      prefs.setString('email_me', '');
      prefs.setString('password_me', '');
    }
  }

  void loadUserEmailPassword() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      valueLogin.value = _prefs.getBool("ingatLogin") ?? false;
      emailController.text = _prefs.getString("email_me") ?? "";
      passwordController.text = _prefs.getString("password_me") ?? "";
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    loadUserEmailPassword();
    super.onInit();
  }
}
