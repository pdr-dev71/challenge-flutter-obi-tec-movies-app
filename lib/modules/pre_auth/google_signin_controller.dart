import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_go/core/ui/loader/loader.dart';
import 'package:movies_go/core/ui/messages/messages.dart';
import 'package:movies_go/router/router_navigation.dart';
import 'package:movies_go/services/signin_google/google_signin_service.dart';

class GoogleSigninController extends GetxController
    with LoaderMixin, MessagesMixin {
  final GoogleSigninService _googleSigninService;
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  GoogleSigninController({
    required GoogleSigninService googleSigninService,
  }) : _googleSigninService = googleSigninService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  Future<void> signinwithgoogle() async {
    try {
      loading(true);
      await _googleSigninService.signinwithgoogle();
      loading(false);
      Get.offAllNamed(AppRouter.home);
      Get.snackbar(
        'Sucesso',
        'Bem vindo ao Movies Go',
        backgroundColor: const Color(0xFF5FCFED),
        colorText: Colors.white,
      );
    } catch (e, s) {
      print(e);
      print(s);
      loading(false);
      message(
        MessageModel.error(
          title: 'Error',
          message: 'Login with Error',
        ),
      );
    }
  }
}
