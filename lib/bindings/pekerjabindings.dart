import 'package:get/get.dart';
import 'package:tugasakhir/controller/pekerjacontroller.dart';

class PekerjaBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PekerjaController>(() => PekerjaController());
  }
}
