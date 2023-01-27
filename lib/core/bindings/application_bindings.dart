import 'package:get/get.dart';
import 'package:movies_go/core/api/rest_client.dart';
import 'package:movies_go/core/auth/auth_service.dart';
import 'package:movies_go/repositories/google_signin/google_signin_repository_impl.dart';
import 'package:movies_go/repositories/movies/movies_repository.dart';
import 'package:movies_go/repositories/movies/movies_repository_impl.dart';
import 'package:movies_go/services/movies/movie_service.dart';
import 'package:movies_go/services/movies/movie_service_impl.dart';
import 'package:movies_go/services/signin_google/google_signin_service.dart';
import 'package:movies_go/services/signin_google/google_signin_service_impl.dart';

import '../../repositories/google_signin/google_signin_repository.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RestClient(),
      fenix: true,
    );

    Get.lazyPut<GoogleSigninRepository>(
      () => GoogleSigninRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut<GoogleSigninService>(
      () => GoogleSigninServiceImpl(
        googleSigninRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.put(
      AuthService(),
    ).init();
    Get.lazyPut<MoviesRepository>(
      () => MoviesRepositoryImpl(
        restClient: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut<MoviesService>(
      () => MoviesServiceImpl(
        moviesRepository: Get.find(),
      ),
      fenix: true,
    );
  }
}
