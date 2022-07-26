import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tugasakhir/component/button_custom.dart';
import 'package:tugasakhir/component/dropdown_custom.dart';
import 'package:tugasakhir/component/style.dart';
import 'package:tugasakhir/component/textfieldcustom.dart';
import 'package:tugasakhir/controller/mainc.dart';

import '../../model/detail_activity_response.dart';

class EditJadwalScreen extends StatefulWidget {
  final Data? data;
  const EditJadwalScreen({Key? key, this.data}) : super(key: key);

  @override
  State<EditJadwalScreen> createState() => _EditJadwalScreenState();
}

class _EditJadwalScreenState extends State<EditJadwalScreen> {
  final main = Get.find<MainController>();
  @override
  void initState() {
    super.initState();
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
                    'Edit Jadwal',
                    style: TextStyle(
                        color: Style.text2Color,
                        fontFamily: Style.font,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          buildlist()
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16),
        child: ButtonCustom(
            text: 'Simpan',
            onPressed: () {
              main.updateActivity(widget.data!.id.toString());
            }),
      ),
    );
  }

  buildlist() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Expanded(
      flex: 9,
      child: Container(
        padding: EdgeInsets.fromLTRB(
            16, 24, 16, MediaQuery.of(context).viewInsets.bottom * 0.3),
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
            Fieldcustome(
              hintText: 'Nama Pertemuan',
              controller: main.nama,
            ),
            const SizedBox(
              height: 10,
            ),
            Fieldcustome(
              hintText: 'Lokasi Pertemuan',
              controller: main.lokasi,
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                tglLahir(context);
              },
              child: AbsorbPointer(
                child: Fieldcustome(
                  hintText: 'Tanggal Pertemuan',
                  controller: main.tanggal,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Flexible(
                    child: GestureDetector(
                  onTap: () {
                    _selectTime(context);
                  },
                  child: AbsorbPointer(
                    child: Fieldcustome(
                      hintText: 'Waktu Pertemuan',
                      controller: main.start,
                    ),
                  ),
                )),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '-',
                  style: TextStyle(
                      color: Style.text2Color,
                      fontFamily: Style.font,
                      fontSize: 15),
                ),
                Flexible(
                    child: GestureDetector(
                  onTap: () {
                    _selectTimeFinish(context);
                  },
                  child: AbsorbPointer(
                    child: Fieldcustome(
                      hintText: 'Waktu Selesai',
                      controller: main.finish,
                    ),
                  ),
                )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Fieldcustome(
              line: 3,
              hintText: 'Catatan',
              controller: main.catatan,
            )
          ],
        ),
      ),
    );
  }

  DateTime selectedDate = DateTime.now();
  Future<Null> tglLahir(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate) selectedDate = picked;
    main.tanggal.value = TextEditingValue(
        text: DateFormat("yyyy-MM-dd hh:m:s", "id_ID")
            .format(DateTime.parse(picked.toString())));
    setState(() {});
  }

  TimeOfDay selectedTime = TimeOfDay.now();
  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
        print(timeOfDay);
        main.start.text =
            selectedTime.hour.toString() + ':' + selectedTime.minute.toString();
        main.startDate = DateTime.now().toString();
      });
    }
  }

  _selectTimeFinish(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
        main.finish.text =
            selectedTime.hour.toString() + ':' + selectedTime.minute.toString();
        main.finishDate = DateTime.now().toString();
      });
    }
  }
}
