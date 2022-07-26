import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasakhir/component/style.dart';
import 'package:tugasakhir/screen/cuti/addcuti.dart';
import 'package:tugasakhir/screen/cuti/detalcuti.dart';

class CutiScreen extends StatefulWidget {
  const CutiScreen({Key? key}) : super(key: key);

  @override
  State<CutiScreen> createState() => _CutiScreenState();
}

class _CutiScreenState extends State<CutiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.mainColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          InkWell(
            onTap: () {
              Get.to(() => AddCutiScreen());
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
                    Icons.add,
                    color: Style.text1Color,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Tambah Permohonan Cuti',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Permohonan Cuti',
                    style: TextStyle(
                        color: Style.text2Color,
                        fontFamily: Style.font,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Jatah Cuti : 15 / Tahun',
                      style: TextStyle(
                        color: Style.text2Color,
                        fontFamily: Style.font,
                        fontSize: 11,
                      ))
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
        child: ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(() => DetailCutiScreen());
                },
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Style.text1Color,
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 16,
                              color: Color(0xff000000).withOpacity(0.05),
                              spreadRadius: 0,
                              offset: Offset(0, -4))
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Permohonan Cuti',
                              style: TextStyle(
                                  color: Style.text2Color,
                                  fontFamily: Style.font,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '19 Jan 2021',
                              style: TextStyle(
                                  color: Style.text4Color,
                                  fontFamily: Style.font,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Style.thirdColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'DITERIMA',
                            style: TextStyle(
                                color: Style.text6Color,
                                fontFamily: Style.font,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Deskripsi',
                          style: TextStyle(
                              color: Style.text2Color,
                              fontFamily: Style.font,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //tanggal cuti
                        Row(
                          children: [
                            Text(
                              'Tanggal Cuti',
                              style: TextStyle(
                                  color: Style.text2Color,
                                  fontFamily: Style.font,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              ': 19 Jan 2021',
                              style: TextStyle(
                                  color: Style.text2Color,
                                  fontFamily: Style.font,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //Ada acara pernikahan keluarga besar di Surabaya, Jawa Timur
                        Text(
                          'Ada acara pernikahan keluarga besar di Surabaya, Jawa Timur',
                          style: TextStyle(
                              color: Style.text4Color,
                              fontFamily: Style.font,
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
