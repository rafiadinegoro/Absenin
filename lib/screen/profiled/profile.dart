import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugasakhir/component/style.dart';
import 'package:tugasakhir/screen/profiled/editprofile.dart';
import 'package:tugasakhir/screen/profiled/editprofilepekerja.dart';
import 'package:tugasakhir/screen/profiled/ubahpass.dart';

import '../../routes/app_routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Style.mainColor,
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
                width: width,
                height: height * 0.2,
                decoration: BoxDecoration(
                    color: Style.secondColor,
                    borderRadius: BorderRadius.circular(16)),
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: ClipPath(
                          clipper: MyWaveClipper(),
                          child: Container(
                            width: width,
                            height: height * 0.1,
                            color: const Color(0xffCCD4D8).withOpacity(0.1),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/avatar.png'),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Nama Lengkap',
                                    style: TextStyle(
                                        fontFamily: Style.font,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Style.text1Color),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Nama Lengkap',
                                    style: TextStyle(
                                        fontFamily: Style.font,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color: Style.text1Color),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Nama Lengkap',
                                    style: TextStyle(
                                        fontFamily: Style.font,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color: Style.text1Color),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Style.text1Color,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff000000).withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    )
                  ]),
              child: ListTile(
                leading: Icon(
                  Icons.edit_note_outlined,
                  color: Style.text2Color,
                ),
                title: Text(
                  'Edit Profile',
                  style: TextStyle(
                      fontFamily: Style.font,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Style.text2Color),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Style.text1Color,
                ),
                onTap: () {
                  Get.to(() => EditProfilePekerja());
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //ubah password
            Container(
              decoration: BoxDecoration(
                  color: Style.text1Color,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff000000).withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    )
                  ]),
              child: ListTile(
                leading: Icon(
                  Icons.lock_outline,
                  color: Style.text2Color,
                ),
                onTap: () {
                  Get.to(() => EditPasswordScreen());
                },
                title: Text(
                  'Ubah Password',
                  style: TextStyle(
                      fontFamily: Style.font,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Style.text2Color),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Style.text1Color,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xffEEBDBA),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xffEEBDBA),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    )
                  ]),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Color(0xffCB3A31),
                ),
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.clear();
                  Get.toNamed(Routename.login);
                },
                title: Text(
                  'Logout',
                  style: TextStyle(
                      fontFamily: Style.font,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffCB3A31)),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Style.text1Color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _appBar() {
    return AppBar(
      title: Text('Profile',
          style: TextStyle(
              fontFamily: Style.font,
              color: Style.text2Color,
              fontSize: 16,
              fontWeight: FontWeight.w800)),
      backgroundColor: Style.text1Color,
      elevation: 0,
      // leading: IconButton(
      //     onPressed: () {},
      //     icon: Icon(
      //       Icons.arrow_back_ios,
      //       color: Style.text2Color,
      //     )),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
    );
  }
}

class MyWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, 10.0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 40.0);

    //see my previous post to understand about Bezier Curve waves
    // https://www.hellohpc.com/flutter-how-to-make-bezier-curve-waves-using-custom-clippath/

    for (int i = 0; i < 10; i++) {
      if (i % 2 == 0) {
        path.quadraticBezierTo(
            size.width - (size.width / 16) - (i * size.width / 8),
            0.0,
            size.width - ((i + 1) * size.width / 8),
            size.height - 160);
      } else {
        path.quadraticBezierTo(
            size.width - (size.width / 16) - (i * size.width / 8),
            size.height - 120,
            size.width - ((i + 1) * size.width / 8),
            size.height - 160);
      }
    }

    path.lineTo(0.0, 40.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
