import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasakhir/controller/mainc.dart';
import 'package:tugasakhir/model/cutiresponse.dart';

import '../../component/dateformat.dart';
import '../../component/style.dart';

class Permohonan extends StatefulWidget {
  const Permohonan({Key? key}) : super(key: key);

  @override
  State<Permohonan> createState() => _PermohonanState();
}

class _PermohonanState extends State<Permohonan> {
  final main = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Permohonan Cuti',
              style: TextStyle(
                  color: Style.text2Color,
                  fontFamily: Style.font,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Style.text1Color,
              ),
              child: main.listCuti.isEmpty
                  ? const Center(
                      child: Text('Data Kosong'),
                    )
                  : ListView.builder(
                      itemCount: main.listCuti.length,
                      itemBuilder: (ctx, index) {
                        Cuti cuti = main.listCuti[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: const CircleAvatar(
                                  radius: 20,
                                ),
                                title: Text(
                                  'Nama',
                                  style: TextStyle(
                                      color: Style.text2Color,
                                      fontFamily: Style.font,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
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
                                    fontWeight: FontWeight.w800),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Tanggal Cuti : ${NumberAndDate.formattglindo(cuti.submittedDate.toString())} - ${NumberAndDate.formattglindo(cuti.finishedDate.toString())}',
                                style: TextStyle(
                                    color: Style.text2Color,
                                    fontFamily: Style.font,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${cuti.description}',
                                style: TextStyle(
                                    color: Style.text4Color,
                                    fontFamily: Style.font,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      }),
            ),
          )
        ],
      ),
    );
  }
}
