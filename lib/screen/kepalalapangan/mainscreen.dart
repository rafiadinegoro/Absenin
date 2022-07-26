import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasakhir/component/style.dart';
import 'package:tugasakhir/component/toast.dart';
import 'package:tugasakhir/controller/mainc.dart';
import 'package:tugasakhir/screen/cuti/cuti.dart';
import 'package:tugasakhir/screen/home/home.dart';
import 'package:tugasakhir/screen/kepalalapangan/addjadwal.dart';
import 'package:tugasakhir/screen/kepalalapangan/beranda.dart';
import 'package:tugasakhir/screen/kepalalapangan/home.dart';
import 'package:tugasakhir/screen/kepalalapangan/pekerja.dart';
import 'package:tugasakhir/screen/kepalalapangan/profileKepala.dart';
import 'package:tugasakhir/screen/profiled/profile.dart';

class MainKepalaScreen extends StatefulWidget {
  final int? tab;
  const MainKepalaScreen({Key? key, this.tab}) : super(key: key);

  @override
  _MainKepalaScreenState createState() => _MainKepalaScreenState();
}

class _MainKepalaScreenState extends State<MainKepalaScreen> {
  final mainC = Get.find<MainController>();
  @override
  void initState() {
    if (widget.tab != null) {
      mainC.tabIndex = widget.tab!;
    }

    super.initState();
  }

  DateTime currentBackPressTime = DateTime(2019);

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      ToastCustom.toastInfo('Press again to Exit');
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(),
      child: GetBuilder<MainController>(
        builder: (controller) {
          return Scaffold(
            body: IndexedStack(
              index: controller.tabIndex,
              // ignore: prefer_const_literals_to_create_immutables
              children: const [
                BerandaKepala(),
                HomeKepala(),
                PekerjaScreen(),
                ProfileKepala(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.black,
              unselectedItemColor: Style.text2Color,
              onTap: controller.changeTabIndex,
              currentIndex: controller.tabIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Style.text1Color,
              elevation: 0,
              items: [
                _bottomNavigationBarItem(
                  icon: Icons.home_outlined,
                  activeicon: Icons.home,
                  label: 'Beranda',
                ),
                _bottomNavigationBarItem(
                  icon: Icons.edit_calendar_outlined,
                  activeicon: Icons.edit_calendar_rounded,
                  label: 'Jadwal',
                ),
                _bottomNavigationBarItem(
                  icon: Icons.supervised_user_circle_outlined,
                  activeicon: Icons.supervised_user_circle,
                  label: 'Pekerja',
                ),
                _bottomNavigationBarItem(
                  icon: Icons.person,
                  activeicon: Icons.person,
                  label: 'Profile',
                ),
              ],
            ),
            floatingActionButton: controller.tabIndex == 1
                ? FloatingActionButton(
                    onPressed: () {
                      // Get.to(() => const AddJadwalScreen());
                      _showPopupMenu();
                    },
                    backgroundColor: Style.text1Color,
                    child: Icon(
                      Icons.add,
                      color: Style.text3Color,
                    ),
                  )
                : null,
          );
        },
      ),
    );
  }

  void _showPopupMenu() async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        MediaQuery.of(context).size.width - 200,
        MediaQuery.of(context).size.height - 200,
        70,
        MediaQuery.of(context).size.height * 0.3,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      items: [
        PopupMenuItem<String>(
            // ignore: sort_child_properties_last
            child: InkWell(
              onTap: () {
                Get.to(() => const AddJadwalScreen());
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: Style.text1Color,
                      borderRadius: BorderRadius.circular(100)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_circle_outline,
                        color: Style.text2Color,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      const Text('Tambah Jadwal'),
                    ],
                  )),
            ),
            value: 'Doge'),
      ],
      elevation: 8.0,
    );
  }

  _bottomNavigationBarItem(
      {IconData? icon, IconData? activeicon, String? label}) {
    return BottomNavigationBarItem(
      activeIcon: Container(
        padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
        decoration: BoxDecoration(
          color: const Color(0xffCCD4D8),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(
          activeicon,
          color: Style.text4Color,
        ),
      ),
      icon: Icon(
        icon,
        color: Style.text4Color,
      ),
      label: label,
    );
  }
}
