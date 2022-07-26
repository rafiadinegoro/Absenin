import 'package:flutter/material.dart';
import 'package:tugasakhir/component/button_custom.dart';
import 'package:tugasakhir/component/button_disable.dart';
import 'package:tugasakhir/component/style.dart';

import '../../component/textfieldcustom.dart';

class EditProfilePekerja extends StatefulWidget {
  const EditProfilePekerja({Key? key}) : super(key: key);

  @override
  State<EditProfilePekerja> createState() => _EditProfilePekerjaState();
}

class _EditProfilePekerjaState extends State<EditProfilePekerja> {
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
                  'Rafi Adinegoro',
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
                    child:
                        ButtonDisableCustom(text: 'Kembali', onPressed: () {})),
                const SizedBox(
                  width: 10,
                ),
                Flexible(child: ButtonCustom(text: 'Simpan', onPressed: () {})),
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
          ),
          SizedBox(
            height: height * 0.02,
          ),
          //fielcustome email, tanggal lahir , no handphone
          Fieldcustome(
            hintText: 'Email',
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Fieldcustome(
            hintText: 'Tanggal Lahir',
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Fieldcustome(hintText: 'No Handphone'),
          SizedBox(
            height: height * 0.02,
          ),
          Container(
            decoration: BoxDecoration(
              color: Style.text1Color,
              // border: Border.all(color: Style.secondColor),
              borderRadius: BorderRadius.circular(10),
            ),
            width: width,
            child: TextFormField(
              maxLines: 3,
              style: TextStyle(
                  color: Style.text2Color,
                  fontFamily: Style.font,
                  fontSize: 14),
              decoration: InputDecoration(
                  label: Text(
                    'Address',
                    style: TextStyle(
                        color: Style.text2Color,
                        fontFamily: Style.font,
                        fontSize: 14),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Style.secondColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Style.secondColor),
                  ),
                  hintText: 'Address',
                  hintStyle: TextStyle(
                      fontFamily: Style.font,
                      fontSize: 14,
                      color: Style.text4Color)),
            ),
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
