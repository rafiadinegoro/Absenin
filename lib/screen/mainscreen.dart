import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugasakhir/component/style.dart';
import 'package:tugasakhir/component/toast.dart';
import 'package:tugasakhir/controller/mainc.dart';
import 'package:tugasakhir/controller/pekerjacontroller.dart';
import 'package:tugasakhir/screen/cuti/cuti.dart';
import 'package:tugasakhir/screen/home/home.dart';
import 'package:tugasakhir/screen/profiled/profile.dart';

class Mainscreen extends StatefulWidget {
  final int? tab;
  const Mainscreen({Key? key, this.tab}) : super(key: key);

  @override
  _MainscreenState createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  final mainC = Get.find<PekerjaController>();
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
      child: GetBuilder<PekerjaController>(
        builder: (controller) {
          return Scaffold(
            body: IndexedStack(
              index: controller.tabIndex,
              // ignore: prefer_const_literals_to_create_immutables
              children: const [
                HomeScreen(),
                CutiScreen(),
                ProfileScreen(),
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
                  label: 'Home',
                ),
                _bottomNavigationBarItem(
                  icon: Icons.description_outlined,
                  activeicon: Icons.description,
                  label: 'Cuti',
                ),
                _bottomNavigationBarItem(
                  icon: Icons.person,
                  activeicon: Icons.person,
                  label: 'Profile',
                ),
              ],
            ),
          );
        },
      ),
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
