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
      Get.snackbar(
        'Sucesso',
        'Bem vindo ao Movies Go',
        backgroundColor: const Color(0xFF5FCFED),
        colorText: Colors.white,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'Erro',
          'Nenhum usuário encontrado para esse email.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'Erro',
          'Senha incorreta para esse email.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }
}
