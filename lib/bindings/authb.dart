import 'package:get/get.dart';
import 'package:tugasakhir/controller/authc.dart';

class AuthB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
