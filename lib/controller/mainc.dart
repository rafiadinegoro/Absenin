import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugasakhir/model/dashboard_chief.dart';
import 'package:tugasakhir/model/detail_activity_response.dart';
import 'package:tugasakhir/model/user_response.dart';
import 'package:tugasakhir/routes/app_routes.dart';
import 'package:tugasakhir/services/kepalalangapan.dart';

import '../component/toast.dart';
import '../model/activity_model.dart';
import '../model/cutiresponse.dart';

class MainController extends GetxController {
  int tabIndex = 0;
  var isLoading = true.obs;
  var name = "".obs;
  TextEditingController nama = TextEditingController();
  TextEditingController lokasi = TextEditingController();
  TextEditingController tanggal = TextEditingController();
  TextEditingController start = TextEditingController();
  TextEditingController finish = TextEditingController();
  TextEditingController catatan = TextEditingController();
  TextEditingController namaPengguna = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController ubahnama = TextEditingController();
  TextEditingController ubahpassword = TextEditingController();
  TextEditingController ubahhp = TextEditingController();
  TextEditingController passnew = TextEditingController();
  TextEditingController passnew2 = TextEditingController();
  DashboardChief dashboardChief = DashboardChief();
  String finishDate = "";
  String startDate = "";
  List<Chief> chiefActivities = [];
  List<Activity> activities = [];
  List<Cuti> listCuti = [];
  List<Users> listUser = [];
  Data detailActivityResponse = Data();
  List<Report> reports = [];
  void changeTabIndex(int index) {
    tabIndex = index;
    switch (tabIndex) {
      case 0:
        getDashboard();
        break;
      case 1:
        getAktivity();
        break;
      case 2:
        getPaid();
        break;

      default:
    }
    update();
  }

  getAktivity() async {
    try {
      isLoading.value = true;
      final response = await KepalaLapanganServices().getActivity();
      activities = response.data![0];
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  getPaid() async {
    try {
      isLoading.value = true;
      final response = await KepalaLapanganServices().getCuti();
      listCuti = response.data![0];
      final users = await KepalaLapanganServices().getUsers();
      listUser = users.data![0];
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  getDashboard() async {
    try {
      isLoading.value = true;
      final response = await KepalaLapanganServices().getDashboard();
      dashboardChief = response;
      chiefActivities = dashboardChief.data!;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  getDetailActivity(String id) async {
    try {
      isLoading(true);
      final response = await KepalaLapanganServices().getDetailActivity(id);
      detailActivityResponse = response.data!;
      reports = detailActivityResponse.reports!;
      isLoading(false);
    } catch (e) {
      isLoading(false);
      ToastCustom.toastError(e.toString());
    }
  }

  deleteactivity(String id) async {
    EasyLoading.show(status: "Deleting...");
    try {
      isLoading(true);
      await KepalaLapanganServices().deleteActivity(id).then((value) {
        if (value == true) {
          EasyLoading.dismiss();
          ToastCustom.toastSuccess("Success");
          Get.toNamed(Routename.dashboardKepala);
        } else {
          EasyLoading.dismiss();
          ToastCustom.toastError("Failed");
        }
      });
    } catch (e) {
      isLoading(false);
      ToastCustom.toastError(e.toString());
    }
  }

  postActivity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('id') ?? '0';
    EasyLoading.show(status: "Posting...");
    try {
      isLoading(true);
      await KepalaLapanganServices()
          .postActivity(
              id, id, lokasi.text, catatan.text, startDate, finishDate)
          .then((value) {
        if (value == true) {
          EasyLoading.dismiss();
          ToastCustom.toastSuccess("Success");
          Get.toNamed(Routename.dashboardKepala);
        } else {
          EasyLoading.dismiss();
        }
      });
    } catch (e) {
      isLoading(false);
      ToastCustom.toastError(e.toString());
    }
  }

  updateActivity(String idd) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('id') ?? '0';
    EasyLoading.show(status: "Posting...");
    try {
      isLoading(true);
      await KepalaLapanganServices()
          .updateActivity(
              idd, id, id, lokasi.text, catatan.text, startDate, finishDate)
          .then((value) {
        if (value == true) {
          EasyLoading.dismiss();
          ToastCustom.toastSuccess("Success");
          Get.toNamed(Routename.dashboardKepala);
          getAktivity();
        } else {
          EasyLoading.dismiss();
        }
      });
    } catch (e) {
      isLoading(false);
      ToastCustom.toastError(e.toString());
    }
  }

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString('name') ?? "";
  }

  postRegister() async {
    EasyLoading.show(status: "Posting...");
    try {
      isLoading(true);
      await KepalaLapanganServices()
          .register(namaPengguna.text, email.text, phoneNumber.text)
          .then((value) {
        if (value == true) {
          EasyLoading.dismiss();
          ToastCustom.toastSuccess("Success");
          Get.toNamed(Routename.dashboardKepala);
        } else {
          EasyLoading.dismiss();
        }
      });
    } catch (e) {
      isLoading(false);
      ToastCustom.toastError(e.toString());
    }
  }

  updateuser() async {
    EasyLoading.show(status: "Posting...");
    try {
      isLoading(true);
      await KepalaLapanganServices()
          .updateUser(ubahnama.text, ubahhp.text, ubahpassword.text,
              passnew.text, passnew2.text)
          .then((value) {
        if (value == true) {
          EasyLoading.dismiss();
          ToastCustom.toastSuccess("Success");
          Get.toNamed(Routename.dashboardKepala);
        } else {
          EasyLoading.dismiss();
        }
      });
    } catch (e) {
      isLoading(false);
      ToastCustom.toastError(e.toString());
    }
  }

  @override
  void onInit() {
    getUser();
    super.onInit();
  }
}
