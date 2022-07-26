import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasakhir/component/button_custom.dart';
import 'package:tugasakhir/component/button_disable.dart';
import 'package:tugasakhir/component/dateformat.dart';
import 'package:tugasakhir/component/listbuleet.dart';
import 'package:tugasakhir/component/style.dart';
import 'package:tugasakhir/model/activity_model.dart';
import 'package:tugasakhir/model/dashboard_chief.dart';
import 'package:tugasakhir/screen/home/riwayat.dart';
import 'package:tugasakhir/screen/kepalalapangan/editjadwal.dart';

import '../../controller/mainc.dart';

class DetailActivityScreen extends StatefulWidget {
  final String id;
  final Activity activity;
  const DetailActivityScreen(
      {Key? key, required this.id, required this.activity})
      : super(key: key);

  @override
  State<DetailActivityScreen> createState() => _DetailActivityScreenState();
}

class _DetailActivityScreenState extends State<DetailActivityScreen> {
  final mainC = Get.find<MainController>();
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      mainC.getDetailActivity(widget.id);
    });
    super.initState();
  }

  void _showPopupMenu() async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        MediaQuery.of(context).size.width - 200,
        MediaQuery.of(context).size.height * 0.1,
        10,
        MediaQuery.of(context).size.height * 0.3,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      items: [
        PopupMenuItem<String>(
            // ignore: sort_child_properties_last
            child: InkWell(
              onTap: () {
                Get.to(() => EditJadwalScreen(
                      data: mainC.detailActivityResponse,
                    ));
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Style.text1Color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.edit_note_outlined,
                      color: Style.text2Color,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Edit Jadwal',
                      style: TextStyle(
                          fontFamily: Style.font,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Style.text2Color),
                    ),
                  ],
                ),
              ),
            ),
            value: 'edit'),
        PopupMenuItem<String>(
            // ignore: sort_child_properties_last
            child: InkWell(
              onTap: () {
                _showMyDialog();
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xffF5D8D6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    ImageIcon(AssetImage('assets/images/trash.png')),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Hapus Jadwal',
                      style: TextStyle(
                          fontFamily: Style.font,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Style.text2Color),
                    ),
                  ],
                ),
              ),
            ),
            value: 'delete'),
      ],
      elevation: 8.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.mainColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              _showPopupMenu();
            },
          )
        ],
      ),
      body: Obx(() => mainC.isLoading.value == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Ciomas",
                              style: TextStyle(
                                  fontFamily: Style.font,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Style.text2Color)),
                          Container(
                            padding: const EdgeInsets.all(15),
                            margin: const EdgeInsets.only(top: 10, bottom: 0),
                            decoration: BoxDecoration(
                              color: Style.text2Color,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                                mainC.detailActivityResponse.statusActivity
                                    .toString(),
                                style: TextStyle(
                                    fontFamily: Style.font,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Style.text1Color)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                mainC.isLoading.value == true ? Container() : _pageDetail()
              ],
            )),
    );
  }

  _pageDetail() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Style.text1Color,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Style.text2Color,
                        radius: 20,
                        child: Icon(
                          Icons.location_on_outlined,
                          color: Style.text1Color,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Lokasi',
                        style: TextStyle(
                            fontFamily: Style.font,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Style.text2Color),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Jl Raya Kepulauan Seribu',
                    style: TextStyle(
                        fontFamily: Style.font,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Style.text2Color),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Style.text2Color,
                        radius: 20,
                        child: Icon(
                          Icons.calendar_today_outlined,
                          color: Style.text1Color,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Tanggal',
                        style: TextStyle(
                            fontFamily: Style.font,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Style.text2Color),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    '${NumberAndDate.dateFormat(widget.activity.createdAt.toString())}',
                    style: TextStyle(
                        fontFamily: Style.font,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Style.text2Color),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Style.text2Color,
                        radius: 20,
                        child: Icon(
                          Icons.access_time_outlined,
                          color: Style.text1Color,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Time',
                        style: TextStyle(
                            fontFamily: Style.font,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Style.text2Color),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      mainC.detailActivityResponse.startTime != null &&
                              mainC.detailActivityResponse.finishTime != null
                          ? '${NumberAndDate.hourpick(mainC.detailActivityResponse.startTime!)} - ${NumberAndDate.hourpick(mainC.detailActivityResponse.finishTime!)} WIB'
                          : 'Kosong',
                      style: TextStyle(
                          fontFamily: Style.font,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Style.text2Color)),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Style.text2Color,
                        radius: 20,
                        child: Icon(
                          Icons.person_outline,
                          color: Style.text1Color,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Pekerja Lapangan',
                        style: TextStyle(
                            fontFamily: Style.font,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Style.text2Color),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Style.text2Color,
                        radius: 15,
                        child: Icon(
                          Icons.person_outline,
                          color: Style.text1Color,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Rizky',
                        style: TextStyle(
                            fontFamily: Style.font,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Style.text2Color),
                      ),
                    ],
                  ),
                ],
              ),
              Container()
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text('Catatan',
              style: TextStyle(
                  fontFamily: Style.font,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Style.text2Color)),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${mainC.detailActivityResponse.description}',
            style: TextStyle(
                fontFamily: Style.font,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Style.text2Color),
          ),
          const SizedBox(
            height: 15,
          ),
          Divider(
            color: Style.text3Color,
          ),
          const SizedBox(
            height: 15,
          ),
          const RiwayatStatus()
          // Text(
          //   'Tambah data untuk hadir',
          //   style: TextStyle(
          //       fontFamily: Style.font,
          //       fontSize: 14,
          //       fontWeight: FontWeight.w500,
          //       color: Style.text2Color),
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          // ListBullets(const [
          //   'Foto Pekerja Lapangan Di lokasi',
          //   'Foto Aktivitas',
          //   'Foto Lapangan Hasil Pertemuan',
          //   'Aktivitas selesai jika data sudah di input kedalam siklus'
          // ]),
        ],
      ),
    );
  }

  modalButtonShit() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
            height: height * 0.6,
            decoration: BoxDecoration(
                color: Style.text1Color,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Foto Pekerja Lapang di Lokasi',
                      style: TextStyle(
                          fontFamily: Style.font,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Style.text2Color),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.highlight_remove_rounded,
                          color: Style.text2Color,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: height * 0.2,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Style.text4Color)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_a_photo_outlined,
                            color: Style.text2Color,
                          )),
                      Text(
                        'Tambah Foto',
                        style: TextStyle(
                            color: Style.text4Color,
                            fontFamily: Style.font,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                      label: Text(
                        'Catatan',
                        style: TextStyle(color: Style.text4Color),
                      ),
                      hintText: 'Masukan Catatan Tambahan',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Style.text4Color)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Style.text4Color))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Flexible(
                        child: ButtonDisableCustom(
                            text: 'FOTO ULANG', onPressed: () {})),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        child: ButtonCustom(text: 'KIRIM', onPressed: () {}))
                  ],
                )
              ],
            ),
          );
        });
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
                        'Hapus Jadwal',
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
                  Text('Apakah anda yakin ingin menghapus jadwal ini?',
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
                              text: 'TIDAK',
                              onPressed: () {
                                Navigator.pop(context);
                              })),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                          child: ButtonCustom(
                              text: 'HAPUS',
                              onPressed: () {
                                mainC.deleteactivity(widget.id);
                              }))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
