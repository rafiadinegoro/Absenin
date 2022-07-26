import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasakhir/component/button_custom.dart';
import 'package:tugasakhir/component/style.dart';
import 'package:tugasakhir/component/textfieldcustom.dart';
import 'package:tugasakhir/screen/cuti/editcuti.dart';

class DetailCutiScreen extends StatefulWidget {
  const DetailCutiScreen({Key? key}) : super(key: key);

  @override
  State<DetailCutiScreen> createState() => _DetailCutiScreenState();
}

class _DetailCutiScreenState extends State<DetailCutiScreen> {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                  InkWell(
                    onTap: () {
                      Get.to(() => EditCutiScreen());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Style.secondColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit,
                            color: Style.text1Color,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Edit Data Cuti',
                            style: TextStyle(
                                color: Style.text1Color,
                                fontFamily: Style.font,
                                fontSize: 11),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          buildlist()
        ],
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
            Text('Tanggal Mulai Cuti',
                style: TextStyle(fontSize: 14, fontFamily: Style.font)),
            const SizedBox(
              height: 5,
            ),
            Text('25 Juli 2022',
                style: TextStyle(fontSize: 16, fontFamily: Style.font)),
            const SizedBox(
              height: 20,
            ),
            Text('Tanggal Selesai Cuti',
                style: TextStyle(fontSize: 14, fontFamily: Style.font)),
            const SizedBox(
              height: 5,
            ),
            Text('25 Juli 2022',
                style: TextStyle(fontSize: 16, fontFamily: Style.font)),
            const SizedBox(
              height: 20,
            ),
            Text('Catatan',
                style: TextStyle(fontSize: 14, fontFamily: Style.font)),
            const SizedBox(
              height: 5,
            ),
            Text('Ada acara pernikahan keluarga besar di Surabaya, Jawa Timur',
                style: TextStyle(fontSize: 16, fontFamily: Style.font)),
            const SizedBox(
              height: 20,
            ),
            Text('Surat Undangan Pernikahan',
                style: TextStyle(fontSize: 14, fontFamily: Style.font)),
            const SizedBox(
              height: 5,
            ),
            Image.asset('assets/images/pernikahan.png')
          ],
        ),
      ),
    );
  }
}
