import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasakhir/component/button_custom.dart';
import 'package:tugasakhir/component/style.dart';
import 'package:tugasakhir/component/textfieldcustom.dart';

class EditCutiScreen extends StatefulWidget {
  const EditCutiScreen({Key? key}) : super(key: key);

  @override
  State<EditCutiScreen> createState() => _EditCutiScreenState();
}

class _EditCutiScreenState extends State<EditCutiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.mainColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Style.text2Color,
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tambah Cuti',
                    style: TextStyle(
                        color: Style.text2Color,
                        fontFamily: Style.font,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('Detail Cuti',
                      style: TextStyle(
                        color: Style.text2Color,
                        fontFamily: Style.font,
                        fontSize: 11,
                      )),
                ],
              ),
            ),
          ),
          buildlist()
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16),
        child: ButtonCustom(text: 'Simpan', onPressed: () {}),
      ),
    );
  }

  buildlist() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Expanded(
      flex: 9,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Style.text1Color,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 16,
                  color: Color(0xff000000).withOpacity(0.05),
                  spreadRadius: 0,
                  offset: Offset(0, -4))
            ]),
        child: ListView(
          children: [
            Fieldcustome(hintText: 'Tanggal Cuti'),
            const SizedBox(
              height: 10,
            ),
            Fieldcustome(hintText: 'Tanggal Selesai Cuti'),
            const SizedBox(
              height: 10,
            ),
            Fieldcustome(
              hintText: 'Keterangan',
              line: 5,
            ),
          ],
        ),
      ),
    );
  }
}
