import 'package:get/get.dart';
import 'package:tugasakhir/controller/mainc.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
  }
}
