import 'package:get/get.dart';
import 'package:tugasakhir/bindings/authb.dart';
import 'package:tugasakhir/bindings/mainb.dart';
import 'package:tugasakhir/bindings/pekerjabindings.dart';
import 'package:tugasakhir/screen/auth/login.dart';
import 'package:tugasakhir/screen/kepalalapangan/mainscreen.dart';
import 'package:tugasakhir/screen/mainscreen.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
        name: Routename.dasboard,
        page: () => const Mainscreen(),
        binding: PekerjaBindings()),
    GetPage(
        name: Routename.dashboardKepala,
        page: () => const MainKepalaScreen(),
        binding: MainBindings()),
    GetPage(
      name: Routename.login,
      page: () => const LoginScreen(),
      binding: AuthB(),
    ),
  ];
}
