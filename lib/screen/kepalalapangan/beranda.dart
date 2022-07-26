import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tugasakhir/component/button_custom.dart';
import 'package:tugasakhir/component/style.dart';
import 'package:tugasakhir/controller/mainc.dart';
import 'package:tugasakhir/model/dashboard_chief.dart';
import 'package:tugasakhir/screen/home/detail.dart';
import 'package:tugasakhir/screen/kepalalapangan/detailactivity.dart';

class BerandaKepala extends StatefulWidget {
  const BerandaKepala({Key? key}) : super(key: key);

  @override
  State<BerandaKepala> createState() => _BerandaKepalaState();
}

class _BerandaKepalaState extends State<BerandaKepala> {
  DateTime _selectedDay = DateTime.now().add(Duration(days: -30));
  DateTime _focusedDay = DateTime.now();
  final kepala = Get.find<MainController>();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return Obx(() => kepala.isLoading.value == true
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: Style.mainColor,
            body: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Style.text1Color,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(30)),
                  ),
                  child: SafeArea(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24.5, 20, 24.5, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Selamat Datang, ${kepala.name}',
                              style: TextStyle(
                                  fontFamily: Style.font,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Style.text2Color),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.notifications_outlined,
                                color: Style.text2Color,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      //show calendar picker
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24.5, 0, 24.5, 10),
                        child: TableCalendar(
                            calendarFormat: _calendarFormat,
                            sixWeekMonthsEnforced: false,
                            locale: 'id',
                            rowHeight: 40,
                            daysOfWeekHeight: 40,
                            firstDay:
                                _selectedDay.add(const Duration(days: -30)),
                            lastDay: _selectedDay.add(const Duration(days: 30)),
                            focusedDay: _selectedDay,
                            selectedDayPredicate: (day) {
                              return isSameDay(_selectedDay, day);
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              if (!isSameDay(_selectedDay, selectedDay)) {
                                // Call `setState()` when updating the selected day
                                setState(() {
                                  _selectedDay = selectedDay;
                                  _focusedDay = focusedDay;
                                });
                              }
                            },
                            onFormatChanged: (format) {
                              setState(() {
                                _calendarFormat = format;
                              });
                            },
                            calendarBuilders: CalendarBuilders(
                              dowBuilder: (context, day) {
                                if (day.weekday == DateTime.sunday) {
                                  final text = DateFormat.E().format(day);

                                  return Center(
                                    child: Text(
                                      text,
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  );
                                }
                              },
                            )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(24.5, 0, 24.5, 0),
                        width: width,
                        height: height * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Flexible(
                                flex: 2,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: width,
                                  decoration: BoxDecoration(
                                    color: Style.text2Color,
                                    borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(10)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Total Jadwal',
                                        style: TextStyle(
                                            fontFamily: Style.font,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Style.text1Color),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${kepala.dashboardChief.jumlah} Jadwal',
                                        style: TextStyle(
                                            fontFamily: Style.font,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Style.text1Color),
                                      ),
                                    ],
                                  ),
                                )),
                            Flexible(
                                flex: 2,
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        width: width,
                                        decoration: const BoxDecoration(
                                          color: Color(0xffD9E9E2),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10)),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Selesai',
                                              style: TextStyle(
                                                  fontFamily: Style.font,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xff43936C)),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              '${kepala.dashboardChief.aktifitasSelesai}',
                                              style: TextStyle(
                                                  fontFamily: Style.font,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xff43936C)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        width: width,
                                        decoration: const BoxDecoration(
                                          color: Color(0xffF5E5D5),
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(10)),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Progress',
                                              style: TextStyle(
                                                  fontFamily: Style.font,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xffCD7B2E)),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              '${kepala.dashboardChief.aktifitasSelesai}',
                                              style: TextStyle(
                                                  fontFamily: Style.font,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xffCD7B2E)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      )
                    ],
                  )),
                ),
                _listBuilder()
              ],
            ),
          ));
  }

  Widget _listBuilder() {
    double width = MediaQuery.of(context).size.width;
    return Expanded(
        flex: 3,
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Text('Rekap Performa Pekerja Lapang',
                    style: TextStyle(
                        color: Style.text2Color,
                        fontFamily: Style.font,
                        fontSize: 15)),
              ),
              Flexible(
                flex: 8,
                child: kepala.chiefActivities.isEmpty
                    ? Center(
                        child: Text('Tidak ada data',
                            style: TextStyle(
                                color: Style.text2Color,
                                fontFamily: Style.font,
                                fontSize: 15)),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return _itemCard(index);
                        },
                        itemCount: kepala.chiefActivities.length,
                      ),
              ),
            ],
          ),
        ));
  }

  Widget _itemCard(index) {
    double width = MediaQuery.of(context).size.width;
    Chief chief = kepala.chiefActivities[index];
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: width,
      decoration: BoxDecoration(
          color: Style.text1Color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color(0xff000000).withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          child: Icon(
                            Icons.person,
                            color: Style.text2Color,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${chief.name}',
                          style: TextStyle(
                              fontFamily: Style.font,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Style.text2Color),
                        ),
                      ],
                    ),
                    //arrow top right
                    Icon(
                      Icons.keyboard_arrow_up,
                      color: Style.text2Color,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jadwal',
                          style: TextStyle(
                              color: Style.text2Color,
                              fontFamily: Style.font,
                              fontSize: 11,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${chief.unfinishedActivities}',
                          style: TextStyle(
                              color: Style.text2Color,
                              fontFamily: Style.font,
                              fontSize: 11,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selesai',
                          style: TextStyle(
                              color: const Color(0xff43936C),
                              fontFamily: Style.font,
                              fontSize: 11,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${chief.finishedActivity}',
                          style: TextStyle(
                              color: const Color(0xff43936C),
                              fontFamily: Style.font,
                              fontSize: 11,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox()
                  ],
                ),
              ],
            ),
          ),
          ButtonCustom(
              text: 'LIHAT DETAIL',
              onPressed: () {
                Get.to(() => DetailBerandaKepalaScreen(
                    id: chief.id.toString(), activity: chief));
              })
        ],
      ),
    );
  }
}
