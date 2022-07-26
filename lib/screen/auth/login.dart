import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasakhir/component/button_custom.dart';
import 'package:tugasakhir/component/style.dart';
import 'package:tugasakhir/component/textfieldcustom.dart';
import 'package:tugasakhir/component/textfliedpasscustom.dart';
import 'package:tugasakhir/controller/authc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Style.mainColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.fromLTRB(24.5, 24, 24.5, 0),
                width: width * 0.8,
                height: height * 0.4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/icon_login.png'),
                      fit: BoxFit.contain),
                ),
              ),
            ),
            _buildTextField(auth)
          ],
        ),
      ),
      bottomSheet: Container(
          padding: const EdgeInsets.all(10),
          child: ButtonCustom(
            text: 'Login',
            onPressed: () {
              auth.handleLogin();
            },
          )),
    );
  }

  Widget _buildTextField(AuthController auth) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Expanded(
      flex: 3,
      child: Container(
        padding: const EdgeInsets.fromLTRB(24.5, 10, 24.5, 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Login',
                style: TextStyle(
                    fontFamily: Style.font,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Style.text2Color)),
            SizedBox(
              height: height * 0.02,
            ),
            Fieldcustome(
              controller: auth.emailController,
              hintText: 'Email',
            ),
            SizedBox(
              height: height * 0.02,
            ),
            TextFieldFullPassCustome(
                hintText: 'Password', controller: auth.passwordController),
            SizedBox(
              height: height * 0.02,
            ),
            //remember me checkbox button and forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Row(
                      children: [
                        Checkbox(
                          value: auth.valueLogin.value,
                          onChanged: (value) {
                            auth.valueLogin.value = value!;
                            print(auth.valueLogin.value);
                          },
                        ),
                        Text('Remember me',
                            style: TextStyle(
                                fontFamily: Style.font,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Style.text2Color)),
                      ],
                    )),
                // Text('Forgot password?',
                //     style: TextStyle(
                //         fontFamily: Style.font,
                //         fontSize: 14,
                //         fontWeight: FontWeight.bold,
                //         color: Style.text2Color))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
