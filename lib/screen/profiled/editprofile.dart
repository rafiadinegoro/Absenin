import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasakhir/component/button_custom.dart';
import 'package:tugasakhir/component/button_disable.dart';
import 'package:tugasakhir/component/style.dart';
import 'package:tugasakhir/component/textfliedpasscustom.dart';

import '../../component/textfieldcustom.dart';
import '../../controller/mainc.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final main = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Style.text1Color,
      appBar: _appBar(),
      body: ListView(
        children: [
          Container(
            color: Style.mainColor,
            width: width,
            height: height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${main.name}',
                  style: TextStyle(
                      color: Style.text2Color,
                      fontFamily: Style.font,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Style.secondColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Pekerja Lapangan',
                    style: TextStyle(
                        color: Style.text1Color,
                        fontFamily: Style.font,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'NIP : 169039232',
                  style: TextStyle(
                    color: Style.text2Color,
                    fontFamily: Style.font,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          buildFormField(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: ButtonDisableCustom(
                        text: 'Kembali',
                        onPressed: () {
                          Get.back();
                        })),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                    child: ButtonCustom(
                        text: 'Simpan',
                        onPressed: () {
                          main.updateuser();
                        })),
              ],
            ),
          )
        ],
      ),
    );
  }

  buildFormField() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      color: Style.text1Color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Fieldcustome(
            hintText: 'Nama',
            controller: main.ubahnama,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          //fielcustome email, tanggal lahir , no handphone

          Fieldcustome(
            hintText: 'No Handphone',
            controller: main.ubahhp,
            textInputType: TextInputType.number,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          TextFieldFullPassCustome(
            hintText: 'Password Lama',
            controller: main.ubahpassword,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          //fielcustome email, tanggal lahir , no handphone
          TextFieldFullPassCustome(
            hintText: 'Password Baru',
            controller: main.passnew,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          TextFieldFullPassCustome(
            hintText: 'Konfirmasi Password',
            controller: main.passnew2,
          ),
          SizedBox(
            height: height * 0.02,
          ),
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      title: Text('Edit Profile',
          style: TextStyle(
              fontFamily: Style.font,
              color: Style.text2Color,
              fontSize: 16,
              fontWeight: FontWeight.w800)),
      backgroundColor: Style.text1Color,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Style.text2Color,
          )),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
    );
  }
}
