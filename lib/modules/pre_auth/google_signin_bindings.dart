import 'package:get/get.dart';
import 'package:movies_go/modules/pre_auth/google_signin_controller.dart';

class GoogleSigninBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GoogleSigninController(
        googleSigninService: Get.find(),
      ),
    );
  }
}
