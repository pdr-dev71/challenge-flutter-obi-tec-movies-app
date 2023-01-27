import 'package:firebase_auth/firebase_auth.dart';

abstract class GoogleSigninRepository {
  Future<UserCredential> signinwithgoogle();
  logout() {}
}
