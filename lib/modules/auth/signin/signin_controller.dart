import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_go/router/router_navigation.dart';

class SigninController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool loading = false;

  @override
  void onReady() {
    super.onReady();
    final user = auth.currentUser;
    if (user != null) {
      user.reload();
    }
  }

  void signin(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offNamed(AppRouter.home);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'Erro',
          'Nenhum usuário encontrado para esse email.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'Erro',
          'Senha incorreta para esse email.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }
}
