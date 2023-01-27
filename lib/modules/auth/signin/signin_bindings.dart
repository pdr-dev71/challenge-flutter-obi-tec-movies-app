import 'package:get/get.dart';
import 'package:movies_go/modules/auth/signin/signin_controller.dart';

class SigninBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigninController>(() => SigninController());
  }
}
