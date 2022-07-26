import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasakhir/component/button_custom.dart';
import 'package:tugasakhir/component/button_disable.dart';
import 'package:tugasakhir/component/dateformat.dart';
import 'package:tugasakhir/component/style.dart';
import 'package:tugasakhir/model/detail_activity_response.dart';

import '../../controller/mainc.dart';

class RiwayatStatus extends StatefulWidget {
  const RiwayatStatus({Key? key}) : super(key: key);

  @override
  State<RiwayatStatus> createState() => _RiwayatStatusState();
}

class _RiwayatStatusState extends State<RiwayatStatus> {
  final mainC = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Obx((() => mainC.isLoading.value == true
        ? Container()
        : Expanded(
            child: Container(
              height: height * 0.6,
              color: Style.text1Color,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Riwayat Status',
                    style: TextStyle(
                        fontFamily: Style.font,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Style.text2Color),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                      child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: mainC.reports.length,
                    itemBuilder: (context, index) {
                      Report report = mainC.reports[index];
                      return Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        width: width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Text(
                                    '${NumberAndDate.hourpick(report.createdAt!)}',
                                    style: TextStyle(
                                        color: Style.text2Color,
                                        fontFamily: Style.font,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Icon(
                                    Icons.circle,
                                    color: Style.text4Color,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  flex: 20,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${report.description}',
                                        style: TextStyle(
                                            color: Style.text2Color,
                                            fontFamily: Style.font,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      // Container(
                                      //   width: width,
                                      //   height: height * 0.2,
                                      //   decoration: const BoxDecoration(
                                      //       image: DecorationImage(
                                      //           image: AssetImage(
                                      //               'assets/images/image-1.png'),
                                      //           fit: BoxFit.cover)),
                                      // ),
                                      // const SizedBox(
                                      //   height: 10,
                                      // ),
                                      // Text(
                                      //   '${report.description}',
                                      //   style: TextStyle(
                                      //       color: Style.text2Color,
                                      //       fontFamily: Style.font,
                                      //       fontWeight: FontWeight.w500,
                                      //       fontSize: 11),
                                      // ),
                                      // const SizedBox(
                                      //   height: 10,
                                      // ),
                                      // Container(
                                      //   padding: const EdgeInsets.all(5),
                                      //   decoration: BoxDecoration(
                                      //       color: const Color(0xffCCD4D8),
                                      //       borderRadius:
                                      //           BorderRadius.circular(10)),
                                      //   child: Row(
                                      //     children: [
                                      //       Flexible(
                                      //           child: Icon(
                                      //         Icons.location_on_outlined,
                                      //         color: Style.text2Color,
                                      //       )),
                                      //       const SizedBox(
                                      //         width: 10,
                                      //       ),
                                      //       Flexible(
                                      //           flex: 10,
                                      //           child: Text(
                                      //             'Jl. Kenangan Ciomas, Ciomas, Jawa Barat',
                                      //             style: TextStyle(
                                      //                 color: Style.text2Color,
                                      //                 fontFamily: Style.font,
                                      //                 fontSize: 10,
                                      //                 fontWeight:
                                      //                     FontWeight.w500),
                                      //           ))
                                      //     ],
                                      //   ),
                                      // )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonCustom(
                      text: 'TERIMA PERMINTAN',
                      onPressed: () {
                        _showMyDialog();
                      })
                ],
              ),
            ),
          )));
  }

  Future<void> _showMyDialog() async {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Style.mainColor,
            content: Container(
              height: height * 0.25,
              width: width,
              decoration: BoxDecoration(
                  color: Style.mainColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Aktivitas Selesai',
                        style: TextStyle(
                            color: Style.text2Color,
                            fontFamily: Style.font,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset('assets/images/remove-icon.png'))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Style.text4Color,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                      'Apakah data nasabah sudah dimasukan kedalam sistem SIKLUS',
                      style: TextStyle(
                          color: Style.text2Color,
                          fontFamily: Style.font,
                          fontWeight: FontWeight.w500,
                          fontSize: 14)),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: ButtonDisableCustom(
                              text: 'BELUM', onPressed: () {})),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                          child: ButtonCustom(text: 'SUDAH', onPressed: () {}))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
