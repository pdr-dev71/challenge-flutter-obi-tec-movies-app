import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_go/repositories/google_signin/google_signin_repository.dart';
import 'package:movies_go/services/signin_google/google_signin_service.dart';

class GoogleSigninServiceImpl implements GoogleSigninService {
  final GoogleSigninRepository _googleSigninRepository;

  GoogleSigninServiceImpl({
    required GoogleSigninRepository googleSigninRepository,
  }) : _googleSigninRepository = googleSigninRepository;

  @override
  Future<UserCredential> signinwithgoogle() =>
      _googleSigninRepository.signinwithgoogle();

  @override
  Future<void> logout() => _googleSigninRepository.logout();
}
