import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_go/modules/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo_splash.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              const CircularProgressIndicator(
                color: Color(0xFF5FCFED),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
