import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:movies_go/router/router_navigation.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    await Future.delayed(const Duration(seconds: 3));
    if (FirebaseAuth.instance.currentUser != null) {
      Get.offNamed(AppRouter.home);
    } else {
      Get.offNamed(AppRouter.preAuth);
    }

    super.onReady();
  }
}
