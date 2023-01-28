import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_go/models/user_model.dart';
import 'package:movies_go/router/router_navigation.dart';

class SignupController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void _createUserFirestore(UserModel user, User firebaseUser) {
    _db.doc('/users/${firebaseUser.uid}').set(user.toMap());
  }

  void signup(String name, String email, String password) async {
    const CircularProgressIndicator();
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((result) async {
        print('uID: ${result.user!.uid}');
        print('email: ${result.user!.email}');

        //create the new user object
        UserModel newUser = UserModel(
          uid: result.user!.uid,
          email: result.user!.email!,
          name: result.user!.displayName,
          profileImage: result.user!.photoURL,
        );
        //create the user in firestore
        _createUserFirestore(newUser, result.user!);
      });
      Get.toNamed(AppRouter.signin);
      Get.snackbar(
        'Conta criada com sucesso',
        'Realize o login',
        snackPosition: SnackPosition.TOP,
        backgroundColor: const Color(0xFF5FCFED),
        colorText: Colors.white,
      );
    } on FirebaseAuthException catch (error) {
      Get.snackbar('Erro ao cadastrar', error.message!,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 10),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }
}
