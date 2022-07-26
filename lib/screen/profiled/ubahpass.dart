import 'package:flutter/material.dart';
import 'package:tugasakhir/component/button_custom.dart';
import 'package:tugasakhir/component/button_disable.dart';
import 'package:tugasakhir/component/style.dart';

import '../../component/textfieldcustom.dart';
import '../../component/textfliedpasscustom.dart';

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({Key? key}) : super(key: key);

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Style.text1Color,
      appBar: _appBar(),
      body: ListView(
        children: [
          buildFormField(),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: ButtonDisableCustom(text: 'Kembali', onPressed: () {})),
            const SizedBox(
              width: 10,
            ),
            Flexible(child: ButtonCustom(text: 'Simpan', onPressed: () {})),
          ],
        ),
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
          TextFieldFullPassCustome(hintText: 'Password Lama'),
          SizedBox(
            height: height * 0.02,
          ),
          //fielcustome email, tanggal lahir , no handphone
          TextFieldFullPassCustome(hintText: 'Password Baru'),
          SizedBox(
            height: height * 0.02,
          ),
          TextFieldFullPassCustome(hintText: 'Konfirmasi Password'),
          SizedBox(
            height: height * 0.02,
          ),
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      title: Text('Edit Password',
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
