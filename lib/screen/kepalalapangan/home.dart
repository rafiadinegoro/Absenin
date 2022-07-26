import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tugasakhir/component/button_custom.dart';
import 'package:tugasakhir/component/dateformat.dart';
import 'package:tugasakhir/component/style.dart';
import 'package:tugasakhir/controller/mainc.dart';
import 'package:tugasakhir/model/activity_model.dart';
import 'package:tugasakhir/screen/home/detail.dart';
import 'package:tugasakhir/screen/kepalalapangan/detail.dart';
import 'package:tugasakhir/screen/kepalalapangan/detailactivity.dart';

class HomeKepala extends StatefulWidget {
  const HomeKepala({Key? key}) : super(key: key);

  @override
  State<HomeKepala> createState() => _HomeKepalaState();
}

class _HomeKepalaState extends State<HomeKepala> {
  final kepala = Get.find<MainController>();
  DateTime _selectedDay = DateTime.now().add(Duration(days: -30));
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //status bar transparent
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      backgroundColor: Style.mainColor,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Style.text1Color,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
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
                      Obx(() => Text(
                            'Selamat Datang, ${kepala.name}',
                            style: TextStyle(
                                fontFamily: Style.font,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Style.text2Color),
                          )),
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
                      firstDay: _selectedDay.add(Duration(days: -30)),
                      lastDay: _selectedDay.add(Duration(days: 30)),
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
              ],
            )),
          ),
          _listBuilder()
        ],
      ),
    );
  }

  Widget _listBuilder() {
    double width = MediaQuery.of(context).size.width;
    return Expanded(
        flex: 3,
        child: Container(
            padding: const EdgeInsets.all(20),
            child: Obx(
              () => kepala.isLoading.value == true
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Text('Sen',
                              style: TextStyle(
                                  color: Style.text2Color,
                                  fontFamily: Style.font,
                                  fontSize: 15)),
                        ),
                        Flexible(
                          flex: 8,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return _itemCard(index);
                            },
                            itemCount: kepala.activities.length,
                          ),
                        ),
                      ],
                    ),
            )));
  }

  Widget _itemCard(index) {
    double width = MediaQuery.of(context).size.width;
    Activity activity = kepala.activities[index];
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(18),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                activity.locationName.toString(),
                style: TextStyle(
                    color: Style.text2Color,
                    fontFamily: Style.font,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: activity.statusActivity == 1
                      ? Style.thirdColor
                      : const Color(0xffBBCCF6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  activity.statusActivity == 1 ? 'Selesai' : 'On Progress',
                  style: TextStyle(
                      color: activity.statusActivity == 1
                          ? Style.text3Color
                          : const Color(0xff3267E3),
                      fontFamily: Style.font,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          //row icon location and address
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Style.text2Color,
                size: 13,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '${activity.locationName}',
                style: TextStyle(
                    color: Style.text2Color,
                    fontFamily: Style.font,
                    fontSize: 10),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          //row icon time and date
          Row(
            children: [
              Icon(
                Icons.access_time_outlined,
                color: Style.text2Color,
                size: 13,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '${NumberAndDate.hourpick(activity.startTime!)} - ${NumberAndDate.hourpick(activity.finishTime!)} WIB',
                style: TextStyle(
                    color: Style.text2Color,
                    fontFamily: Style.font,
                    fontSize: 10),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text('Harap membuat template laporan dan pulpen',
              style: TextStyle(
                  color: Style.text2Color,
                  fontFamily: Style.font,
                  fontSize: 10)),
          SizedBox(
            height: 10,
          ),
          Container(
              padding: const EdgeInsets.all(10),
              child: ButtonCustom(
                  text: 'LIHAT DETAIL',
                  onPressed: () {
                    Get.to(() => DetailActivityScreen(
                        id: activity.id.toString(), activity: activity));
                  }))
        ],
      ),
    );
  }
}
