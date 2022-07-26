import 'package:flutter/material.dart';
import 'package:tugasakhir/component/button_custom.dart';
import 'package:tugasakhir/component/button_disable.dart';
import 'package:tugasakhir/component/listbuleet.dart';
import 'package:tugasakhir/component/style.dart';
import 'package:tugasakhir/screen/home/riwayat.dart';
import 'package:tugasakhir/screen/home/riwayatPekerja.dart';

class DetailHome extends StatefulWidget {
  const DetailHome({Key? key}) : super(key: key);

  @override
  State<DetailHome> createState() => _DetailHomeState();
}

class _DetailHomeState extends State<DetailHome> {
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
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Ciomas',
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
                  child: Text('On Progress',
                      style: TextStyle(
                          fontFamily: Style.font,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Style.text1Color)),
                ),
              ],
            ),
          ),
          _pageDetail()
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Style.text2Color,
          onPressed: () {
            modalButtonShit();
          },
          child: const Icon(Icons.add)),
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
                    'Jl. Ciomas No. 1, Cikarang',
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
                    '20/15/2020',
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
                  Text('08:00 - 17:00 WIB',
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
            'Harap membuat template laporan dan pulpen',
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
          const RiwayatStatusPekerja()
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
}
