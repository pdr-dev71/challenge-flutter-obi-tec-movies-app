import 'package:get/get.dart';
import 'package:movies_go/modules/auth/signup/signup_controller.dart';

class SignupBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
